namespace Tlw.ZPG.Domain.Enums
{
    using System;
    using System.ComponentModel;

    /// <summary>
    /// �������
    /// </summary>
    public enum SystemLogType
    {
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Add,
        /// <summary>
        /// ɾ��
        /// </summary>
        [Description("ɾ��")]
        Delete,
        /// <summary>
        /// �޸�
        /// </summary>
        [Description("�޸�")]
        Update,
        /// <summary>
        /// �����쳣
        /// </summary>
        [Description("�����쳣")]
        Exception,
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Other,
    }
}
