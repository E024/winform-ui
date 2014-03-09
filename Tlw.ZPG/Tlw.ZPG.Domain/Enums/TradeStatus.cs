namespace Tlw.ZPG.Domain.Models
{
    using System;
    using System.ComponentModel;

    public enum TradeStatus
    {
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Normal,
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Froze,
        /// <summary>
        /// ��ֹ
        /// </summary>
        [Description("��ֹ")]
        Terminate,
        /// <summary>
        /// �ѽ������ȴ�������ȷ��
        /// </summary>
        [Description("�ѽ������ȴ�������ȷ��")]
        WaitBidderConfirm,
        /// <summary>
        /// �ѽ������ȴ����������
        /// </summary>
        [Description("�ѽ������ȴ����������")]
        WaitHangVerify,
        /// <summary>
        /// �ѽ��������ͨ��
        /// </summary>
        [Description("�ѽ��������ͨ��")]
        Completed,
    }
}
