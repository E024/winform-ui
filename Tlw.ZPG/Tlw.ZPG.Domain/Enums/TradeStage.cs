
namespace Tlw.ZPG.Domain.Models
{
    using System;
    using System.ComponentModel;

    /// <summary>
    /// ���׽׶�
    /// </summary>
    public enum TradeStage
    {
        /// <summary>
        /// δ֪
        /// </summary>
        [Description("δ֪")]
        None,
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Hang,
        /// <summary>
        /// �ȴ�
        /// </summary>
        [Description("�ȴ�")]
        Ready,
        /// <summary>
        /// ����
        /// </summary>
        [Description("����")]
        Auction,
    }
}
