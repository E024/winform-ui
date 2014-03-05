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
        /// δ���
        /// </summary>
        [Description("δ���")]
        UnVerified,
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Normal,
        /// <summary>
        /// ��ʧ
        /// </summary>
        [Description("��ʧ")]
        Loss,
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Froze
    }
}
