# ☁️ Cloud Provider Selector (Comparison Matrix)

To ensure infrastructure flexibility and compliance, the system supports modular deployment across major cloud platforms. Below is a comparative view of cloud capabilities and the chosen default provider for this project.

| Criteria                 | Azure                            | AWS                          | Google Cloud                   | IBM Cloud                  |
|--------------------------|----------------------------------|------------------------------|--------------------------------|----------------------------|
| IaC Tool                 | Bicep                            | Terraform / CDK              | Terraform / Deployment Manager | Terraform / IBM Schematics |
| Secrets Mgmt             | Azure Key Vault                  | AWS Secrets Manager          | Google Secret Manager           | IBM Secrets Manager        |
| AI Service               | Azure OpenAI                     | Bedrock (Anthropic, Titan)   | Vertex AI (PaLM 2, Gemini)     | watsonx.ai (Granite)       |
| Vector DB (native)       | Azure Cognitive Search / Redis   | Kendra / OpenSearch          | Vertex Matching Engine         | watsonx.data / Milvus      |
| Container Runtime        | Azure Container Apps / AKS       | ECS / EKS                    | Cloud Run / GKE                | Code Engine / OpenShift     |
| Region Support (EU)      | ✅ Yes                           | ✅ Yes                        | ✅ Yes                          | ✅ Yes                      |
| Primary Use Case Fit     | ✅ Strong                         | ⚠️ Integration-heavy         | 🟡 Data science-centric         | ✅ Regulated industry fit   |
| Fallback LLM Option      | Ollama / LM Deploy               | Hugging Face / SageMaker     | Hugging Face / Vertex AI       | Ollama / watsonx.langchain |

---

### ✅ Chosen Provider for This Project: **Azure**

Azure was selected for:
- Strong enterprise compliance posture
- Tight integration with OpenAI + container runtime (ACA)
- Native support for secret management, monitoring, and EU-region deployment