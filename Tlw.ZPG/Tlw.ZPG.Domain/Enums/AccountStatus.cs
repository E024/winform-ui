namespace Tlw.ZPG.Domain.Models.Enums
{
    using System;
    using System.ComponentModel;

    /// <summary>
    /// �˻�״̬
    /// </summary>
    public enum AccountStatus
    {
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Normal = 0,
        /// <summary>
        /// ��ʧ
        /// </summary>
        [Description("��ʧ")]
        Loss = 1,
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Froze = 2
    }
}
