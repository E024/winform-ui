namespace Tlw.ZPG.Domain.Models
{
    using System;
    using System.ComponentModel;

    /// <summary>
    /// �������
    /// </summary>
    public enum TradeType
    {
        /// ����
        /// </summary>
        [Description("����")]
        SubmitPrice,
        /// �����˵�½
        /// </summary>
        [Description("�����˵�½")]
        BidderLogin,
        /// �����˵ǳ�
        /// </summary>
        [Description("�����˵ǳ�")]
        BidderLoginOut,
        /// �������޸�����
        /// </summary>
        [Description("�������޸�����")]
        BidderUpdatePassword,
        /// ������ȷ�ϳɽ�
        /// </summary>
        [Description("����ȷ�ϳɽ�")]
        BidderConfigResult,
    }
}
