---
name: vue-ai-assistant
description: Answer questions about Vue.js, Nuxt, and AI topics using Alexander Opalic's knowledge base. Use this skill when the user asks about Vue, Vue 3, Nuxt, Nuxt 3, Composition API, Vue Router, Pinia, Vite, AI, machine learning, LLMs, or related frontend/AI topics. Triggers on questions like "how do I use Vue", "explain Nuxt", "what's new in Vue 3", "AI agent patterns", or any Vue/AI related query.
---

# Vue & AI Assistant

Answer questions about Vue.js ecosystem and AI topics by fetching knowledge from https://alexop.dev/llms.txt and delegating research to a subagent.

## MANDATORY Workflow

**IMPORTANT: You MUST follow ALL steps below. Do NOT skip the subagent step. Do NOT answer directly after fetching - you MUST delegate to a subagent.**

1. **Fetch the knowledge base**: Use `fetch_webpage` to retrieve content from `https://alexop.dev/llms.txt`
2. **REQUIRED - Delegate to subagent**: Use `runSubagent` with the fetched content and user's question. **This step is NOT optional.**
3. **Return the answer**: Present the subagent's findings to the user

## Implementation

**You MUST execute ALL steps below. Skipping the subagent is a violation of this skill's requirements.**

### Step 1: Fetch Knowledge Base

Use the fetch_webpage tool:
- URL: `https://alexop.dev/llms.txt`
- Query: The user's question about Vue or AI

### Step 2: Run Subagent with Context (MANDATORY)

**You MUST call `runSubagent` - do NOT answer the question yourself. The subagent handles the analysis and response.**

Use `runSubagent` with a detailed prompt containing:

1. The fetched content from llms.txt as the knowledge base
2. The user's original question
3. Instructions to:
   - Analyze the knowledge base content thoroughly
   - Find relevant information to answer the question
   - Provide a clear, concise, and accurate answer
   - Include code examples when relevant
   - Cite specific sections from the knowledge base if applicable
   - If the knowledge base doesn't contain the answer, use general knowledge but note this

Example subagent prompt:

You are a Vue.js and AI expert. Answer the following question using the provided knowledge base content.

KNOWLEDGE BASE CONTENT:
fetched_content

USER QUESTION:
user_question

Analyze thoroughly, provide code examples when relevant, and cite sources from the knowledge base.
### Step 3: Present Answer

Return the subagent's response to the user, formatted appropriately with code blocks and explanations.

## Example

**User asks**: "How do I use composables in Vue 3?"

**Execution**:
1. Fetch https://alexop.dev/llms.txt
2. **MUST** call runSubagent with the content and question (do NOT skip this)
3. Return the subagent's comprehensive answer about Vue 3 composables