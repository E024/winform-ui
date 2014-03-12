namespace Tlw.ZPG.Domain.Models.Trading
{
    using System;
    using System.Collections.Generic;
    using Tlw.ZPG.Domain.Enums;
    using Tlw.ZPG.Domain.Models.Admin;
    using Tlw.ZPG.Infrastructure;

    public partial class Affiche : EntityBase
    {
        public Affiche()
        {
            this.Trades = new HashSet<Trade>();
            this.Nodes = new HashSet<Affiche>();
        }

        #region ����
        public int? ParentId { get; internal set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string OtherContent { get; set; }
        public string QualificationRequire { get; set; }
        public int CreatorId { get; set; }
        public System.DateTime CreateTime { get; set; }
        public System.DateTime SignBeginTime { get; set; }
        public System.DateTime SignEndTime { get; set; }
        public System.DateTime TradeBeginTime { get; set; }
        public System.DateTime TradeEndTime { get; set; }
        public System.DateTime? VerifyTime { get; set; }
        public bool IsRelease { get; set; }
        public System.DateTime ReleaseTime { get; set; }
        public string Notice { get; set; }
        public int CountyId { get; set; }
        public bool IsOnlineAffiche { get; set; }
        public int SellModel { get; set; }
        public string AfficheNumber { get; set; }
        public string RatificationNumber { get; set; }
        public string RatificationOrg { get; set; }
        public AfficheVerifyStatus VerifyStatus { get; set; }
        public int? VerifyUserId { get; set; }

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
                yield return new BusinessRule("����ʱ�䲻��С�ڵ�ǰʱ��");
            }
            if (this.SignBeginTime < DateTime.Now)
            {
                yield return new BusinessRule("����ʱ�䲻��С�ڵ�ǰʱ��");
            }
            if (this.TradeBeginTime < this.SignBeginTime)
            {
                yield return new BusinessRule("������ʼʱ�������ڱ���ʱ��");
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
            this.Trades.Add(trade);
            SetTrade(trade);
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
            if (trade.Land.Purposes.Count == 0)
            {
                throw new DomainException("�ڵ���;���������޲���Ϊ��");
            }
        }

        private void ReleaseCheck(int userId)
        {
            if (this.IsRelease)
            {
                throw new DomainException("�����Ѿ������������ٴη���");
            }
            if (userId != this.CreatorId)
            {
                throw new DomainException("�㲻�Ǵ˹��洴���ߣ����ܷ�������");
            }
            if (this.ParentId.HasValue)
            {
                //���乫��
                if (this.Parent.TradeBeginTime < DateTime.Now)
                {
                    throw new DomainException("ԭ���潻��ʱ���ѵ������ܷ������乫��");
                }
            }
            if (this.ReleaseTime < DateTime.Now)
            {
                throw new DomainException("���淢��ʱ������ڵ�ǰʱ��֮��");
            }
            if (DateTime.Now > this.TradeBeginTime)
            {
                throw new DomainException("���׿�ʼʱ�������ڵ�ǰʱ��");
            }
            if (!this.ParentId.HasValue)
            {
                if (string.IsNullOrEmpty(this.Notice))
                {
                    throw new DomainException("������֪����Ϊ��");
                }
                if (this.Trades.Count == 0)
                {
                    throw new DomainException("�ڵ���Ϣδ����");
                }
            }
        }
    }
}
