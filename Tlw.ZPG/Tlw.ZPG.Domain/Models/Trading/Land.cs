namespace Tlw.ZPG.Domain.Models.Trading
{
    using System;
    using System.Collections.Generic;
    using Tlw.ZPG.Domain.Models.Admin;
    using Tlw.ZPG.Infrastructure;

    public partial class Land : EntityBase
    {
        public Land()
        {
            this.LandAttaches = new HashSet<LandAttach>();
            this.Purposes = new HashSet<Purpose>();
        }

        #region ����
        public string ProjectName { get; set; }
        public string LandNumber { get; set; }
        public string Location { get; set; }
        public decimal Area { get; set; }
        public string LandPurpose { get; set; }
        public int LandState { get; set; }
        public string Phones { get; set; }
        public string Notice { get; set; }
        public string Remark { get; set; }
        public string OtherCondition { get; set; }
        public decimal Capability { get; set; }
        public decimal Density { get; set; }
        public decimal GreenLandRate { get; set; }
        public decimal FulfilGuarantee { get; set; }
        public decimal CompletionGuarantee { get; set; }
        public string LandScope { get; set; }

        public virtual ICollection<LandAttach> LandAttaches { get; internal set; }
        public virtual ICollection<Purpose> Purposes { get; internal set; } 
        #endregion

        public override IEnumerable<BusinessRule> Validate()
        {
            if (string.IsNullOrEmpty(this.ProjectName))
            {
                yield return new BusinessRule("��Ŀ���Ʋ���Ϊ��");
            }
            if (string.IsNullOrEmpty(this.LandNumber))
            {
                yield return new BusinessRule("�ڵغŲ���Ϊ��");
            }
            if (string.IsNullOrEmpty(this.Location))
            {
                yield return new BusinessRule("λ�ò���Ϊ��");
            }
            if (this.Purposes.Count == 0)
            {
                yield return new BusinessRule("�ڵ���;���������޲���Ϊ��");
            }
        }
    }
}
