namespace Tlw.ZPG.Domain.Models
{
    using System;
    using System.ComponentModel;

    /// <summary>
    /// �˻����״̬
    /// </summary>
    public enum AccountVerifyStatus
    {
        /// <summary>
        /// δ�ύ
        /// </summary>
        [Description("δ�ύ")]
        UnSubmit,
        /// δ�ύ
        /// </summary>
        [Description("���ύ")]
        Submited,
        /// δ�ύ
        /// </summary>
        [Description("����ˣ�ͨ��")]
        Verified,
        /// δ�ύ
        /// </summary>
        [Description("����ˣ���������")]
        NotAccept,
        /// δ�ύ
        /// </summary>
        [Description("����ˣ�֪ͨ����")]
        NotifySupply,
        /// δ�ύ
        /// </summary>
        [Description("�Ѳ��������ύ")]
        SuppliedAndSubmited,
    }
}
