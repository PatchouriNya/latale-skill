# latale-price — 韩服彩虹岛物价分析 Skill 插件

分析韩服彩虹岛（라테일/LaTale）物价的 DSH agent skill，随用随长的物品名映射表 + 历史价格库 + 汇率换算。

## 目录结构

```
latale/
├── install.ps1 / install.sh   # 一键安装脚本
├── skills/
│   └── latale-price/          # skill 本体（源，安装脚本从这里复制）
│       ├── SKILL.md           # 主流程
│       ├── items-kr-zh.md     # 韩→中物品名映射表（随使用生长）
│       └── analysis-framework.md  # 分析规则
├── template/
│   └── data/                  # 空白数据模板（只有表头）
└── data/                      # 你自己的实际数据（价格库 + 汇率），不入库分发
```

## 安装

新环境（已装 DSH）只需一步：

- **Windows**：`powershell -ExecutionPolicy Bypass -File install.ps1`
- **macOS / Linux**：`bash install.sh`

脚本把 `skills/latale-price/` 复制到 `~/.dsh/skills/latale-price/`，重开会话即生效。数据文件不用装——skill 首次分析时会自动创建。

## 用法

- 发交易行/拍卖行截图，或粘贴价格文本，说"分析一下"
- 只喂数据不分析时，自动进入快速录入模式（只沉淀不报告）
- 问"贵不贵 / 值不值 / 趋势 / 套利 / 自制还是买成品"
- 报"币价"或"点券价格"更新汇率基准

## 更新

改了仓库里的 skill 文件后，重跑安装脚本即可覆盖。

## 数据说明

- `data/latale-prices.csv` — 物品价格历史（date,item,item_kr,price,qty,enhance,options,source,note）
- `data/exchange-rates.csv` — 游戏币汇率（每 1 亿 Ely 兑人民币）
- `data/cash-rates.csv` — 点券汇率（每 10 万点券兑人民币）

历史行只增不改，修正以新行 + note 追加。
