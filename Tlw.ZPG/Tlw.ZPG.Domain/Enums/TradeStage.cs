
namespace Tlw.ZPG.Domain.Models
{
    using System;
    using System.ComponentModel;

    /// <summary>
    /// ���׽׶�
    /// </summary>
    public enum TradeStage
    {
        /// δ��ʼ
        /// </summary>
        [Description("δ��ʼ")]
        UnStart,
        /// ����
        /// </summary>
        [Description("����")]
        Hang,
        /// �ȴ�
        /// </summary>
        [Description("�ȴ�")]
        Ready,
        /// ����
        /// </summary>
        [Description("����")]
        Auction
    }
}
