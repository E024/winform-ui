namespace Tlw.ZPG.Domain.Models
{
    using System;
    using System.ComponentModel;

    /// <summary>
    /// �������
    /// </summary>
    public enum NewsType
    {
        /// ���߷�����Ѷ
        /// </summary>
        [Description("���߷�����Ѷ")]
        Info,
        /// ֪ʶ�ʴ�
        /// </summary>
        [Description("֪ʶ�ʴ�")]
        QA,
        /// ����������
        /// </summary>
        [Description("����������")]
        FAQ
    }
}
