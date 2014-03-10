namespace Tlw.ZPG.Domain.Models.Bid
{
    using System;
    using System.Collections.Generic;
    using Tlw.ZPG.Domain.Models.Admin;
    using Tlw.ZPG.Domain.Models.Enums;
    using Tlw.ZPG.Domain.Models.Trading;
    using Tlw.ZPG.Infrastructure;
    using Tlw.ZPG.Infrastructure.Utils;

    public partial class Account : EntityBase
    {
        public Account()
        {
            this.AccountVerifies = new HashSet<AccountVerify>();
            this.UnionBidPersons = new HashSet<Person>();
        }

        #region ����
        public string ApplyNumber { get; set; }
        public string Password { get; set; }
        public bool PasswordUpdated { get; set; }
        public System.DateTime CreateTime { get; set; }
        public AccountStatus Status { get; set; }
        public string RandomNumber { get; set; }
        public int TradeId { get; set; }
        public ApplyType ApplyType { get; set; }
        public int ContactId { get; set; }
        public int? AgentId { get; set; }
        public int? CorporationId { get; set; }
        public int AccountPersonId { get; set; }
        public bool IsOnline { get; set; }
        public Nullable<System.DateTime> OnlineTime { get; set; }
        public AccountVerifyStatus VerifyStatus { get; set; }
        public virtual Trade Trade { get; set; }
        public virtual Person Agent { get; set; }
        public virtual Person AccountPerson { get; set; }
        public virtual Person Contact { get; set; }
        public virtual Person Corporation { get; set; }
        public virtual ICollection<AccountVerify> AccountVerifies { get; set; }
        public virtual ICollection<Person> UnionBidPersons { get; set; }
        public virtual ICollection<TradeDetail> TradeDetails { get; set; }
        #endregion

        #region ����

        /// <summary>
        /// ����12λ�����
        /// </summary>
        /// <returns></returns>
        private string GenerateRandomNumber()
        {
            return new Random().NextDouble().ToString().Substring(3, 6) + new Random().NextDouble().ToString().Substring(3, 6);
        }

        /// <summary>
        /// ���룬ע��
        /// </summary>
        public void Apply()
        {
            this.RandomNumber = GenerateRandomNumber();
            this.CreateTime = DateTime.Now;
            this.Status = AccountStatus.Normal;
            this.VerifyStatus = AccountVerifyStatus.UnSubmit;
        }

        /// <summary>
        /// ��ȡ����������
        /// </summary>
        /// <returns></returns>
        public string GetAccountName()
        {
            string name = string.Empty;
            if (this.ApplyType == Models.ApplyType.Union)
            {
                foreach (var item in this.UnionBidPersons)
                {
                    name += item.PersonName + item.Unit;
                }
            }
            else
            {
                name = this.AccountPerson.PersonName + this.AccountPerson.Unit;
            }
            return name;
        }

        /// <summary>
        /// �Ƿ����ύ���
        /// </summary>
        public bool CanSubmitVerify()
        {
            return this.VerifyStatus == AccountVerifyStatus.UnSubmit || this.VerifyStatus == AccountVerifyStatus.NotifySupply;
        }

        /// <summary>
        /// �ύ���
        /// </summary>
        /// <param name="content"></param>
        public void SubmitVerify(string content)
        {
            if (CanSubmitVerify())
            {
                this.VerifyStatus = AccountVerifyStatus.Submited;
                this.AccountVerifies.Add(new AccountVerify()
                {
                    AccountId = this.ID,
                    Content = content,
                    CreateTime = DateTime.Now,
                    IsAdmin = false,
                    Status = this.VerifyStatus,
                    VerifyAccountId = this.ID,
                    VerifyAccount = GetAccountName(),
                });
            }
            else
            {
                throw new SubmitApplyException("��ǰ״̬�������ύ���");
            }
        }

        /// <summary>
        /// ��̨����Ա�Ƿ�������
        /// </summary>
        public bool CanVerifyByUser()
        {
            return this.VerifyStatus == AccountVerifyStatus.Submited || this.VerifyStatus == AccountVerifyStatus.SuppliedAndSubmited;
        }

        /// <summary>
        /// ��̨����Ա���
        /// </summary>
        /// <param name="content"></param>
        /// <param name="user"></param>
        public void VerifyByUser(int userId, string content, string userName, VerifyType verifyType)
        {
            if (CanVerifyByUser())
            {
                this.VerifyStatus = (AccountVerifyStatus)Enum.Parse(typeof(AccountVerifyStatus), verifyType.ToString());
                this.AccountVerifies.Add(new AccountVerify()
                {
                    AccountId = this.ID,
                    Content = content,
                    CreateTime = DateTime.Now,
                    IsAdmin = true,
                    Status = this.VerifyStatus,
                    VerifyAccountId = userId,
                    VerifyAccount = userName,
                });
            }
            else
            {
                throw new VerifyApplyException("��ǰ״̬���������");
            }
        }

        private string GeneratePassword()
        {
            return new Random().NextDouble().ToString().Substring(3, 8);
        }

        /// <summary>
        /// ���ž����
        /// </summary>
        public void GrantApplyNumber(int userId, string applyNumber)
        {
            if (userId != this.Trade.Affiche.CreatorId) throw new GrantApplyNumberException("������ֻ�ܷ����Լ��ڵصľ����");
            if (this.VerifyStatus != AccountVerifyStatus.Verified) throw new GrantApplyNumberException("δ���ͨ���������ž����");
            if (this.Status == AccountStatus.Froze) throw new GrantApplyNumberException("������Ѷ��᲻�����ž����");
            if (this.Trade.Status != TradeStatus.Normal) throw new GrantApplyNumberException("��ǰ�ڵ�״̬�������ž����");
            var days = Application.GetDictionaryValue("MinReleaseNum2TEDay", 2);
            if (DateTime.Now > this.Trade.TradeEndTime.AddDays(-days)) throw new GrantApplyNumberException(string.Format("�����ֻ���ڽ��׽�ֹʱ��ǰ{0}�췢��", days));
            this.ApplyNumber = applyNumber;
            this.Password = GeneratePassword();
            this.Status = AccountStatus.Normal;
        }

        /// <summary>
        /// ���Ὰ���
        /// </summary>
        public void Froze(int userId)
        {
            if (this.Status != AccountStatus.Normal)
            {
                if (this.Trade.CreatorId != userId) throw new AccountFrozeException("�㲻�Ǹ��ڵش����ߣ���������˾����");
                this.Status = AccountStatus.Froze;
            }
            else
            {
                throw new AccountFrozeException("��ǰ״̬�������Ὰ���");
            }
        }

        /// <summary>
        /// �ⶳ���ָ���
        /// </summary>
        public void Recover(int userId)
        {
            if (this.Status == AccountStatus.Froze)
            {
                if (this.Trade.CreatorId != userId) throw new AccountFrozeException("�㲻�Ǹ��ڵش����ߣ�������ⶳ�˾����");
                this.Status = AccountStatus.Normal;
            }
            else
            {
                throw new AccountRecoverException("��ǰ״̬������ⶳ�����");
            }
        }

        public bool CheckPassword(string password)
        {
            return this.Password == SecurityUtil.MD5Encrypt(password);
        }

        public void ResetPassword(int userId)
        {
            this.Password = GeneratePassword();
        }

        public void LossAccount(int userId)
        {
            this.Status = AccountStatus.Loss;
        }

        #endregion

        #region Validate
        public override IEnumerable<BusinessRule> Validate()
        {
            List<BusinessRule> list = new List<BusinessRule>();
            ValidateTrade(list);
            if (this.AccountPerson != null)
            {
                if (this.ApplyType == Models.ApplyType.Natural)
                {
                    ValidatePerson(list, this.AccountPerson, "��Ȼ��");
                }
                else if (this.ApplyType == Models.ApplyType.Corporation || this.ApplyType == Models.ApplyType.OtherOrg)
                {
                    ValidateOrg(list, this.AccountPerson, "");
                }
            }
            if (this.Corporation != null)
            {
                ValidatePerson(list, this.Corporation, "����������");
            }
            if (this.Agent != null)
            {
                ValidatePerson(list, this.Agent, "ί�д�����");
            }
            ValidateContact(list);
            if (this.ApplyType == Models.ApplyType.Union)
            {
                foreach (var item in this.UnionBidPersons)
                {
                    if (item.ApplyType == Models.ApplyType.Natural)
                    {
                        ValidatePerson(list, item, "��Ȼ�ˣ����Ͼ���");
                    }
                    else
                    {
                        ValidateOrg(list, item, "���Ͼ���");
                    }
                }
            }
            return list;
        }

        private void ValidateTrade(List<BusinessRule> list)
        {
            if (this.Trade == null)
            {
                list.Add(new BusinessRule("�����ڴ��ڵ�"));
            }
            else
            {
                if (this.Trade.SignBeginTime > DateTime.Now)
                {
                    list.Add(new BusinessRule("��δ������ʱ��"));
                }
                if (this.Trade.SignEndTime < DateTime.Now)
                {
                    list.Add(new BusinessRule("�ѹ�����ʱ��"));
                }
            }
        }

        private void ValidateOrg(List<BusinessRule> list, Person person, string prefix)
        {
            if (string.IsNullOrEmpty(this.Agent.Unit) || this.Agent.Unit.Length < 8)
            {
                list.Add(new BusinessRule(prefix + "��λ������д������"));
            }
            if (string.IsNullOrEmpty(this.Agent.UnitCode) || this.Agent.UnitCode.Length < 5)
            {
                list.Add(new BusinessRule(prefix + "��λע�������д������"));
            }
            if (string.IsNullOrEmpty(this.Agent.MobilePhone) || this.Agent.MobilePhone.Length < 7)
            {
                list.Add(new BusinessRule(prefix + "�绰��д������"));
            }
            if (!StringUtil.IsPostalCode(this.Agent.PostalCode))
            {
                list.Add(new BusinessRule(prefix + "�ʱ಻��ȷ"));
            }
        }

        private void ValidatePerson(List<BusinessRule> list, Person person, string prefix)
        {
            if (person != null)
            {
                if (string.IsNullOrEmpty(person.PersonName) || person.PersonName.Length < 2)
                {
                    list.Add(new BusinessRule(prefix + "������д������"));
                }
                if (string.IsNullOrEmpty(person.PassportNumber) || person.PassportNumber.Length < 5)
                {
                    list.Add(new BusinessRule(prefix + "֤��������д������"));
                }
                else if (person.PassportType == "���֤" && !StringUtil.IsCardNo(person.PassportType))
                {
                    list.Add(new BusinessRule(prefix + "���֤��д������"));
                }
                if (string.IsNullOrEmpty(person.Address) || person.Address.Length < 12)
                {
                    list.Add(new BusinessRule(prefix + "��ַ��д������"));
                }
                if (string.IsNullOrEmpty(person.MobilePhone) || person.MobilePhone.Length < 7)
                {
                    list.Add(new BusinessRule(prefix + "�绰��д������"));
                }
                if (!StringUtil.IsPostalCode(person.PostalCode))
                {
                    list.Add(new BusinessRule(prefix + "�ʱ಻��ȷ"));
                }
            }
        }

        private void ValidateContact(List<BusinessRule> list)
        {
            if (string.IsNullOrEmpty(this.Contact.PersonName) || this.Contact.PersonName.Length < 2)
            {
                list.Add(new BusinessRule("��ϵ��������д������"));
            }
            if (string.IsNullOrEmpty(this.Contact.Telephone) || this.Contact.Telephone.Length < 7)
            {
                list.Add(new BusinessRule("��ϵ�˹̶��绰��д������"));
            }
            if (!StringUtil.IsMobilePhone(this.Contact.MobilePhone))
            {
                list.Add(new BusinessRule("��ϵ���ֻ����벻��ȷ"));
            }
            if (string.IsNullOrEmpty(this.Contact.Address) || this.Contact.Address.Length < 12)
            {
                list.Add(new BusinessRule("��ϵ�˵�ַ��д������"));
            }
            if (!StringUtil.IsPostalCode(this.Contact.PostalCode))
            {
                list.Add(new BusinessRule("��ϵ���ʱ಻��ȷ"));
            }
        } 
        #endregion
    }
}
