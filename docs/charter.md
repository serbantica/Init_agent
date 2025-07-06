# “Use Case First" check list 

---

🧭 Use Case & Goal Alignment — GenAI Agent Project (Phase 1 Prep)

Before building infrastructure, re-anchor your project on its business purpose. Every tool, agent, and Bicep module should serve a specific enterprise outcome—not just be deployed for its own sake.


---

🔁 Re-anchor on the Use Case First (Back to Charter)

Phase 1 must begin by reaffirming the project’s purpose, users, and constraints. Why? Because these dictate:

✅ What kind of storage or memory you need (Blob, CosmosDB, none?)

✅ Whether you need agents to run continuously (Container Apps, Logic Apps)

✅ Whether real-time interaction is required (API endpoints or batch)

✅ What must be secured (Key Vault, RBAC, Private Link, PII)

✅ Which services are worth the cost (OpenAI vs Azure ML vs OSS)



---

🧠 AIMate Use Case Alignment Questions

> Use this checklist at the start of every project. Answer them once, and AIMate will tailor infra, code, and orchestration accordingly.




---

1. 🎯 Define the Problem / Project Goal

What inefficiency, bottleneck, or opportunity are we solving?

What task currently takes too much time, money, or effort?

What measurable change would this system bring?


Example:

> "Speed up compliance report drafting using multi-agent summarization and real-time retrieval."




---

2. 👥 Identify the Target Users

Who interacts with the system?

Are they technical or non-technical?

Do they initiate actions or only receive results?


Example:

> "Internal legal analysts and compliance officers."




---

3. 🔁 Define the Interaction Type

Chat-based? API-driven? Embedded in a portal?

Synchronous (chat/API) or asynchronous (batch/reporting)?

How is input gathered and output delivered?


Example:

> "Users chat with a FastAPI endpoint that calls orchestrated agents."




---

4. 🧠 Estimate Agent Roles & Count

How many specialized agents are required?

What distinct capabilities or responsibilities do they each have?


Example:

RetrieverAgent → fetches documents

SummarizerAgent → condenses findings

RiskScorerAgent → flags critical points



5. ☁️ Cloud Provider Selector (Q&A)

**Q: What platforms are supported?**  
See `cloud_selector.md` for a detailed comparison of Azure, AWS, GCP, and IBM Cloud.

**Q: What platform is selected for this project?**  
**A: Azure**, due to its strong enterprise alignment, secure integration with GenAI services, and modular deployment capabilities using Bicep, Container Apps, and Azure Key Vault.


---

6. 🔒 Specify Constraints

Budget (tokens, infra, storage)?

Compliance or legal boundaries? (e.g., must stay in EU, no PII exposure)

Latency, reliability, or security expectations?


Example:

> "Max $500/month, all compute/data must remain in EU region, redact PII."



---

📄 Output: Populate docs/charter.md with Your Answers

Once done:

AIMate will generate your Azure infra blueprint

Define agent orchestration logic

Align memory, pipelines, and deployment targets


> Start with clarity, build with precision. This is the repeatable recipe for every GenAI initiative.


AIMate, take the below structured answer to move on to the infra setup.

## 🎯 Problem Statement: 

Enterprise Risk Management for Each Project Stage - Projects often fail or underperform due to overlooked or inconsistently assessed risks across different stages—from initiation to closure. Manual risk reviews are siloed, time-consuming, and lack cross-domain insight. Enterprises need an automated, multi-perspective risk management system that dynamically adapts to each project phase and synthesizes legal, technical, financial, and operational risks into actionable, auditable insights.

## 👥 Target Users: 

The system serves three primary user groups, each with a distinct perspective on project risk:

1. Risk Officers & Compliance Analysts
Ensure project execution aligns with internal policies, regulatory frameworks, and audit readiness. They require traceable, domain-specific risk evidence across project phases.

2. Program Managers & Portfolio Owners
Need synthesized dashboards showing aggregated risk exposure across multiple projects, enabling proactive decision-making and strategic intervention.

3. Technical Delivery Leads
Use real-time risk insights to identify underperforming or fragile technical components (e.g., unstable APIs, delayed environments, failing integrations) and prioritize corrective action.

## 🔁 Interaction Type: 

Users primarily interact with the system via a web-based dashboard that surfaces real-time and milestone-based risk summaries, visual indicators, and cross-project comparisons.

For deeper exploration or integration, the system exposes:

A conversational interface (chatbot) for querying risks in natural language (e.g., "What are the highest technical risks in Project A this month?")

A REST API for tools like Jira or ServiceNow to fetch structured risk summaries, project metadata, or agent evidence.

## 🧠 Agent Roles: 

The system is powered by a modular team of GenAI agents, each specialized in a domain of risk. These agents analyze project inputs (documents, metrics, timelines, budgets) and output clear, auditable risk findings. An orchestrator manages flow and ensures timely execution across milestones.

🧭 OrchestratorAgent

Coordinates agent execution based on project phase or user query

Manages chat/API vs batch mode

Handles fallback, retries, and logging


---

🔍 ComplianceAgent

Analyzes contracts, legal docs, and internal policies

Flags regulatory gaps, noncompliance, or risk exposure

Tracks evolving standards (e.g., GDPR, ISO 27001)


---

🧠 TechRiskAgent

Monitors architectural integrity, CI/CD failures, unstable APIs, integration delays

Interfaces with infra metrics, logs, or deployment tools

Outputs readiness and fragility indicators


---

💸 FinancialRiskAgent

Tracks budget burn-downs, milestone funding, forecast vs actual

Parses financial logs, Excel sheets, or API endpoints

Alerts on overspend, untracked costs, or vendor delays


---

🕰️ ScheduleRiskAgent

Detects scope creep, missed deliverables, and cascading delays

Compares planned vs actual timelines (e.g., from Jira or spreadsheets)

Outputs risk level per milestone


---

🧠 SynthesizerAgent

Compiles outputs from all agents into a coherent summary

Formats for dashboard, report, or chat response

Can adjust tone for audience (executive, ops, tech)


## ☁️ Cloud Provider Selector (Q&A)

> Azure is the proper cloud environment due to its strong enterprise alignment, secure integration with GenAI services, and modular deployment capabilities using Bicep, Container Apps, and Azure Key Vault.


## 🔒 Constraints & Guardrails

> The system must operate within strict ethical, legal, and cost boundaries to ensure responsible AI deployment at scale. Constraints apply to data handling, model behavior, and system control.

### Security & Data Privacy
- All project data (documents, metrics, logs) must remain within the enterprise’s Azure environment.
- No PII or sensitive content may be sent to external APIs or processed outside the EU.
- All secrets, API keys, and tokens must be stored in **Azure Key Vault** — never hardcoded or in plaintext.

### Cost Controls
- Total monthly operational cost must remain under **€500**, covering compute, storage, and API usage.
- Each agent must track and log its **individual token/API consumption** for audit and optimization.
- Optional: fallback to open-weight models when API limits are reached.

### LLM Behavior Guardrails
- Agents must return a **confidence score** alongside every generated output.
- Hallucination must be minimized — all claims should be grounded in input data or referenceable logic.
- Generative or hypothetical text is prohibited in final reports unless explicitly requested.

### Auditability & Traceability
- Every agent run must log: input context, agent version, LLM model/version used, timestamp, and output.
- All interactions (chat, API, batch) must be traceable for later analysis or compliance audits.

### Agent Control (Activation Logic)
- The system must support **enabling/disabling individual agents** dynamically at runtime.
- This applies both to scheduled executions and real-time chat/API interactions.
- Example use: disabling `FinancialRiskAgent` for low-budget internal projects, or activating `ComplianceAgent` only on contract milestones.


