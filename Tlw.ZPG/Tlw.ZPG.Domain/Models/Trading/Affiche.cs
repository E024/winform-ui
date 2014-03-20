namespace Tlw.ZPG.Domain.Models.Trading
{
    using System;
    using System.Collections.Generic;
    using Tlw.ZPG.Domain.Enums;
    using Tlw.ZPG.Domain.Models.Admin;
    using Tlw.ZPG.Infrastructure;
    using Tlw.ZPG.Infrastructure.Utils;

    public partial class Affiche : EntityBase
    {
        public Affiche()
        {
            this.Trades = new HashSet<Trade>();
            this.Nodes = new HashSet<Affiche>();
        }

        #region ����
        /// <summary>
        /// ԭ����ID
        /// </summary>
        public int? ParentId { get; set; }
        /// <summary>
        /// ����
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// ����
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// ��������
        /// </summary>
        public string OtherContent { get; set; }
        /// <summary>
        /// ����Ҫ��
        /// </summary>
        public string QualificationRequire { get; set; }
        /// <summary>
        /// ������֪
        /// </summary>
        public string Notice { get; set; }
        /// <summary>
        /// ���Ʒ�ʽ�����۰취
        /// </summary>
        public string HandModeAndBidMethod { get; set; }
        /// <summary>
        /// �����û�ID
        /// </summary>
        public int CreatorId { get; set; }
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public System.DateTime CreateTime { get; set; }
        /// <summary>
        /// �޸�ʱ��
        /// </summary>
        public System.DateTime? UpdateTime { get; set; }
        /// <summary>
        /// ������ʼʱ��
        /// </summary>
        public System.DateTime SignBeginTime { get; set; }
        /// <summary>
        /// ������ֹʱ��
        /// </summary>
        public System.DateTime SignEndTime { get; set; }
        /// <summary>
        /// ������ʼʱ��
        /// </summary>
        public System.DateTime TradeBeginTime { get; set; }
        /// <summary>
        /// ���׽�ֹʱ��
        /// </summary>
        public System.DateTime TradeEndTime { get; set; }
        /// <summary>
        /// ���ʱ��
        /// </summary>
        public System.DateTime? VerifyTime { get; set; }
        /// <summary>
        /// �Ƿ񷢲�
        /// </summary>
        public bool IsRelease { get; set; }
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public System.DateTime ReleaseTime { get; set; }
        /// <summary>
        /// ������id
        /// </summary>
        public int CountyId { get; set; }
        /// <summary>
        /// ��������
        /// </summary>
        public string AfficheType { get; set; }
        /// <summary>
        /// ���÷�ʽ
        /// </summary>
        public string SellModel { get; set; }
        /// <summary>
        /// ������
        /// </summary>
        public string AfficheNumber { get; set; }
        /// <summary>
        /// �����ţ�2014�ţ�
        /// </summary>
        public string AfficheNumberShort
        {
            get
            {
                string shortNum = string.Empty;
                if (!string.IsNullOrEmpty(AfficheNumber))
                {
                    var index = AfficheNumber.IndexOf('[');
                    var length = AfficheNumber.IndexOf(']') - index + 1;
                    shortNum = AfficheNumber.Substring(index, length);
                }

                return shortNum;
            }
        }
        /// <summary>
        /// ��׼�ĺ�
        /// </summary>
        public string RatificationNumber { get; set; }
        /// <summary>
        /// ��׼����
        /// </summary>
        public string RatificationOrg { get; set; }
        /// <summary>
        /// ���״̬
        /// </summary>
        public AfficheVerifyStatus VerifyStatus { get; set; }
        /// <summary>
        /// ����û�id
        /// </summary>
        public int? VerifyUserId { get; set; }
        /// <summary>
        /// ��ǩ�����,�ָ�
        /// </summary>
        public string Tags { get; set; }
        /// <summary>
        /// ��Դ
        /// </summary>
        public string ComeForm { get; set; }

        public virtual County County { get; set; }
        public virtual User Creator { get; set; }
        public virtual User VerifyUser { get; set; }
        public virtual Affiche Parent { get; internal set; }
        public virtual ICollection<Affiche> Nodes { get; internal set; }
        public virtual ICollection<Trade> Trades { get; internal set; }
        #endregion

        public override IEnumerable<BusinessRule> Validate()
        {
            if (string.IsNullOrEmpty(this.Title))
            {
                yield return new BusinessRule("������ⲻ��Ϊ��");
            }
            if (string.IsNullOrEmpty(this.AfficheNumber))
            {
                yield return new BusinessRule("�����Ų���Ϊ��");
            }
            if (string.IsNullOrEmpty(this.RatificationOrg))
            {
                yield return new BusinessRule("���÷�����׼���ز���Ϊ��");
            }
            if (this.ReleaseTime < DateTime.Now)
            {
                yield return new BusinessRule("����ʱ�䲻�����ڵ�ǰʱ��");
            }
            if (this.SignBeginTime < this.ReleaseTime)
            {
                yield return new BusinessRule("����ʱ�䲻�����ڷ���ʱ��");
            }
            if (this.TradeEndTime < this.SignEndTime)
            {
                yield return new BusinessRule("���׽�ֹʱ�䲻�����ڱ�����ֹʱ��");
            }
            //������ֹʱ�䵽���׽�ֹʱ����С�� 3
            var days = Application.GetDictionaryValue("MinSE2TEDay", 3);
            if ((this.TradeEndTime - this.SignBeginTime).TotalDays < days)
            {
                yield return new BusinessRule(string.Format("������ֹʱ������ڹ��ƽ��׽�ֹʱ���ǰ{0}��", days));
            }
            //���淢��ʱ�䵽������ʼʱ����С�� 20
            days = Application.GetDictionaryValue("MinAfficheR2TSDay", 20);
            if ((this.TradeBeginTime - this.ReleaseTime).TotalDays < days)
            {
                yield return new BusinessRule(string.Format("���淢��ʱ�䵽������ʼʱ����С��{0}��", days));
            }
            //������ʼʱ�䵽���׽���ʱ����С�� 10
            days = Application.GetDictionaryValue("MinTradeS2EDay", 10);
            if ((this.TradeEndTime - this.TradeBeginTime).TotalDays < days)
            {
                yield return new BusinessRule(string.Format("����ʱ��α������{0}��", days));
            }
            //���淢��ʱ�䵽������ֹʱ����С�� 28
            days = Application.GetDictionaryValue("MinAfficheR2SEDay", 28);
            if ((this.SignEndTime - this.ReleaseTime).TotalDays < days)
            {
                yield return new BusinessRule(string.Format("���淢��ʱ�䵽������ֹʱ����С��{0}��", days));
            }
        }

        public void SetContentByTemplete(string templete)
        {
            if (templete == null) throw new DomainException("templete����Ϊnull");
            templete = templete.Replace("{Affiche_Org}", this.ComeForm);
            templete = templete.Replace("{Affiche_Number}", this.AfficheNumber);
            templete = templete.Replace("{RatificationOrg}", this.RatificationOrg);
            templete = templete.Replace("{Affiche_Number_Short}", this.AfficheNumberShort);
            templete = templete.Replace("{Affiche_QualificationRequire}", this.QualificationRequire);
            //templete = templete.Replace("{Affiche_HandModeAndBidMethod}", this.HandModeAndBidMethod);
            templete = templete.Replace("{Affiche_Sign_Time}", this.SignBeginTime.ToString("yyyy��MM��dd��HH����") + this.SignEndTime.ToString("yyyy��MM��dd��HH��"));
            templete = templete.Replace("{Affiche_Trade_Time}", this.TradeBeginTime.ToString("yyyy��MM��dd��HH����") + this.TradeEndTime.ToString("yyyy��MM��dd��HH��"));
            templete = templete.Replace("{Other_Content}", this.OtherContent);
            templete = templete.Replace("{Affiche_Org}", this.ComeForm);
            templete = templete.Replace("{Afiche_Release_Time}", StringUtil.DateToUpper(this.ReleaseTime));
            this.Content = templete;
        }

        /// <summary>
        /// ���乫��
        /// </summary>
        /// <param name="original">ԭ����</param>
        public void Replenish(Affiche original)
        {
            if (original == null) throw new DomainException("ԭ���治��Ϊ��");
            if (!original.IsRelease)
            {
                throw new DomainException("ԭ����û�з���֮ǰ���ܲ��乫��");
            }
            if (original.ParentId.HasValue)
            {
                throw new DomainException("���ܶԲ��乫������ٴβ���");
            }
            this.Parent = original;
        }

        public void Release(int userId)
        {
            ReleaseCheck(userId);
            //���淢����ͬ������ʱ��ͽ���ʱ��
            foreach (var item in this.Trades)
            {
                SetTrade(item);
            }
            this.IsRelease = true;
        }

        private void SetTrade(Trade trade)
        {
            trade.SignBeginTime = this.SignBeginTime;
            trade.SignEndTime = this.SignEndTime;
            trade.TradeBeginTime = this.TradeBeginTime;
            trade.TradeEndTime = this.TradeEndTime;
        }

        public void AddTrade(int userId, Trade trade, Land land)
        {
            CheckThrow(trade, userId);
            trade.Affiche = this;
            trade.CreatorId = this.CreatorId;
            trade.Land = land;
            SetTrade(trade);
            SetTags(land);
            this.Trades.Add(trade);
        }

        private void SetTags(Land land)
        {
            foreach (var item in land.LandPurposes)
            {
                var purpose = item.Purpose;
                DoSetTags(purpose.PurposeName);
                while (purpose.ParentId.HasValue)
                {
                    purpose = purpose.Parent;
                    DoSetTags(purpose.PurposeName);
                }
            }
            this.Tags = this.Tags.TrimEnd(',').TrimStart(',');
        }

        private void DoSetTags(string purposeName)
        {
            if (purposeName.Contains("��ҵ�õ�"))
            {
                this.Tags += "��ҵ�õ�,";
            }
            else if (purposeName.Contains("סլ�õ�") || purposeName.Contains("�̷��õ�"))
            {
                this.Tags += "��ס�õ�,";
            }
            else
            {
                this.Tags += "�����õ�,";
            }
        }

        private void CheckThrow(Trade trade, int userId)
        {
            if (trade == null) throw new DomainException("������Ϣ����Ϊ��");
            if (trade.Land == null) throw new DomainException("������Ϣ����Ϊ��");
            if (userId != this.CreatorId) throw new DomainException("�㲻�ǹ��洴���ߣ��޷�����ڵ�");
            if (string.IsNullOrEmpty(trade.Land.ProjectName))
            {
                throw new DomainException("�ڵ���Ŀ���Ʋ���Ϊ��");
            }
            if (string.IsNullOrEmpty(trade.Land.LandNumber))
            {
                throw new DomainException("�ڵغŲ���Ϊ��");
            }
            if (string.IsNullOrEmpty(trade.Land.Location))
            {
                throw new DomainException("�ڵ�λ�ò���Ϊ��");
            }
            if (trade.Land.LandPurposes.Count == 0)
            {
                throw new DomainException("�ڵ���;���������޲���Ϊ��");
            }
        }

        private void ReleaseCheck(int userId)
        {
            if (this.IsRelease)
            {
                throw new AfficheReleaseException("�����Ѿ������������ٴη���");
            }
            if (userId != this.CreatorId)
            {
                throw new AfficheReleaseException("�㲻�Ǵ˹��洴���ߣ����ܷ�������");
            }
            if (this.ParentId.HasValue)
            {
                //���乫��
                if (this.Trades.Count != this.Parent.Trades.Count)
                {
                    throw new AfficheReleaseException("���乫�治��ɾ�����������ڵ���Ϣ");
                }
                if (this.Parent.TradeBeginTime < DateTime.Now)
                {
                    throw new AfficheReleaseException("ԭ���潻��ʱ���ѵ������ܷ������乫��");
                }
                if (this.ReleaseTime <= this.Parent.ReleaseTime)
                {
                    throw new AfficheReleaseException("���乫�淢��ʱ�䲻������ԭ���淢��ʱ��");
                }
            }
            else
            {
                if (string.IsNullOrEmpty(this.Notice))
                {
                    throw new AfficheReleaseException("������֪����Ϊ��");
                }
                if (this.Trades.Count == 0)
                {
                    throw new AfficheReleaseException("�ڵ���Ϣδ����");
                }
            }
        }
    }
}
