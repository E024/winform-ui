namespace Tlw.ZPG.Domain.Models
{
    using System;
    using System.ComponentModel;

    public enum TradeStatus
    {
        /// ����
        /// </summary>
        [Description("����")]
        Normal,
        /// ����
        /// </summary>
        [Description("����")]
        Froze,
        /// ��ֹ
        /// </summary>
        [Description("��ֹ")]
        Terminate,
        /// �ѽ������ȴ�������ȷ��
        /// </summary>
        [Description("�ѽ������ȴ�������ȷ��")]
        WaitBidderConfirm,
        /// �ѽ������ȴ����������
        /// </summary>
        [Description("�ѽ������ȴ����������")]
        WaitHangVerify,
        /// �ѽ��������ͨ��
        /// </summary>
        [Description("�ѽ��������ͨ��")]
        Verified,
    }
}
