# Cobo Agentic Wallet 开发者文档

基于 [Mintlify](https://mintlify.com/) 构建的 SDK / API 开发者文档站，面向外部开发者提供快速入门、核心概念、使用场景模板和 API 参考。

## 前置条件

- Node.js 18+
- Mintlify CLI（通过 npx 调用，无需全局安装）

## 本地开发

```bash
cd cobo-agent-wallet/mintlify
npx mintlify dev
```

访问 http://localhost:3000 预览文档。

## 目录结构

```
mintlify/
├── docs.json                 # 主配置文件（主题、导航、颜色、社交链接）
├── openapi.json              # OpenAPI/Swagger 规范（API Reference 自动生成）
├── introduction.mdx          # 文档首页
├── installation.mdx          # 安装指南
├── changelog.mdx             # 变更日志
├── quickstart/               # 快速开始（9 篇）
│   ├── index.mdx             #   总览
│   ├── api-client-python.mdx #   Python API Client
│   ├── mcp.mdx               #   MCP Server
│   ├── langchain.mdx         #   LangChain 集成
│   ├── openai.mdx            #   OpenAI Agents 集成
│   ├── agno.mdx              #   Agno 集成
│   ├── crewai.mdx            #   CrewAI 集成
│   ├── cli.mdx               #   CLI 使用
│   └── owner.mdx             #   Owner 快速入门
├── concepts/                 # 核心概念（9 篇）
│   ├── principals.mdx        #   Principal 模型
│   ├── delegations.mdx       #   委托模型
│   ├── policy-engine.mdx     #   策略引擎
│   ├── policy-types.mdx      #   策略类型
│   ├── counters.mdx          #   计数器
│   ├── approval.mdx          #   审批流程
│   ├── error-handling.mdx    #   错误处理
│   ├── self-correction.mdx   #   Agent 自我修正
│   └── audit.mdx             #   审计日志
│   ├── discord-tip-bot.mdx
│   ├── api-micropayment.mdx
│   ├── org-payroll.mdx
│   ├── dca-trader.mdx
│   ├── crosschain-arbitrageur.mdx
│   ├── defi-yield-optimizer.mdx
│   ├── trading-execution.mdx
│   ├── nft-minter.mdx
│   ├── treasury-manager.mdx
│   ├── emergency-kill-switch.mdx
│   ├── self-sustaining-agent.mdx
│   └── agent-to-agent.mdx
├── sdk/                      # SDK 参考（4 篇）
│   ├── client.mdx            #   WalletAPIClient
│   ├── toolkit.mdx           #   Toolkit
│   ├── cli.mdx               #   CLI 工具
│   └── mcp.mdx               #   MCP Server
├── integrations/             # 框架集成（6 篇）
│   ├── langchain.mdx
│   ├── openai.mdx
│   ├── agno.mdx
│   ├── crewai.mdx
│   └── mcp.mdx
├── api-reference/            # API 参考
│   ├── overview.mdx          #   总览
│   ├── identity/             #   Principal 与 API Key（5 篇）
│   ├── wallets/              #   钱包管理（7 篇）
│   ├── transactions/         #   交易管理（7 篇）
│   ├── delegations/          #   委托管理（7 篇）
│   ├── policies/             #   策略管理（6 篇）
│   ├── audit/                #   审计日志（1 篇）
│   ├── events/               #   事件流（1 篇）
│   ├── health/               #   健康检查（1 篇）
│   └── meta/                 #   系统信息（1 篇）
├── snippets/                 # 可复用文档片段（10 个）
├── logo/                     # Logo 资源（dark/light）
└── favicon.svg
```

## 文档导航结构

文档站按 5 个 Tab 组织：

| Tab | 内容 |
|-----|------|
| **Get Started** | 文档首页、安装指南、变更日志、9 篇快速开始教程 |
| **Recipes** | 12 个使用场景模板，覆盖支付、DeFi、NFT、Agent 基础设施等 |
| **Concepts** | 核心概念：Principal、委托、策略引擎、审批、错误处理、自我修正、审计 |
| **SDK Reference** | Client、Toolkit、CLI、MCP、6 个框架集成指南 |
| **API Reference** | 基于 OpenAPI 自动生成的 REST API 文档，含交互式 Playground |

## 新增文档页面

1. 在对应目录下创建 `.mdx` 文件
2. 在 `docs.json` 的 `navigation.tabs` 对应 group 中注册页面路径
3. 运行 `npx mintlify dev` 本地预览确认
