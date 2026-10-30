---
name: new-product-launch
description: "Plan and, after explicit approval, create an Azure DevOps work item hierarchy for a product launch spanning Salesforce CPQ and Oracle Order Management. Accept structured launch details or extract them from supplied notes."
user-invocable: true
---
# New Product Launch — ADO Story Auto-Creation

You are creating a full Azure DevOps work item hierarchy for a new product launch that requires enablement across source systems (Salesforce CPQ and Oracle Order Management).

## STEP 0 — Determine Input Mode

Check whether the user has provided any of the following:
- A pasted meeting transcript or Teams auto-transcript
- Pasted PowerPoint slide text or exported content
- Freeform notes or an email summary

**If unstructured content was provided → run STEP 0A (Extract) before STEP 1.**
**If no content was provided → skip to STEP 1 (ask directly).**

---

## STEP 0A — Extract from Unstructured Content

Read the provided content carefully and extract values for every field in the table below. Apply these rules:

- **Be literal**: use exact SKUs, part numbers, and names as written — do not paraphrase or normalize.
- **Flag gaps**: if a field is not mentioned or is ambiguous, mark it `⚠️ NOT FOUND` — do not guess.
- **Resolve conflicts**: if the same field appears with different values in different parts of the content, note both and ask the user to confirm.
- **Ignore non-launch content**: skip agenda items, presenter introductions, and anything unrelated to product enablement or system configuration.

After extraction, present the filled table to the user for review:

```
## Extracted Product Details — Please Review & Confirm

| Field | Extracted Value | Confidence |
|---|---|---|
| Product Name | [value or ⚠️ NOT FOUND] | High / Low |
| Product Abbreviation | [value or ⚠️ NOT FOUND] | High / Low |
| Top-Level Bundle SKU | [value or ⚠️ NOT FOUND] | High / Low |
| Component SKUs | [value or ⚠️ NOT FOUND] | High / Low |
| Extender SKU | [value or ⚠️ NOT FOUND] | High / Low |
| Regional Variant Suffixes | [value or ⚠️ NOT FOUND] | High / Low |
| AMER/APAC OU | [value or ⚠️ NOT FOUND] | High / Low |
| EMEA OU | [value or ⚠️ NOT FOUND] | High / Low |
| India/SAARC OU | [value or ⚠️ NOT FOUND] | High / Low |
| India Individual FGs | [value or ⚠️ NOT FOUND] | High / Low |
| Separately-orderable accessories | [value or ⚠️ NOT FOUND] | High / Low |
| Functional Council Tag | [value or ⚠️ NOT FOUND] | High / Low |
| CPQ PM Owner | [value or ⚠️ NOT FOUND] | High / Low |
| Oracle PM Owner | [value or ⚠️ NOT FOUND] | High / Low |
| Parent Initiative ID | [value or ⚠️ NOT FOUND] | High / Low |
| Target Iteration | [value or ⚠️ NOT FOUND] | High / Low |
| Price list update needed? | [Yes / No / ⚠️ NOT FOUND] | High / Low |
| Translations needed? | [Yes + languages / No / ⚠️ NOT FOUND] | High / Low |
| Quote Templates to update | [value or ⚠️ NOT FOUND] | High / Low |

⚠️ Fields marked NOT FOUND must be confirmed before work items are created.
```

Ask the user to correct any values and fill in any gaps. Do NOT proceed to STEP 1 until the user confirms the table is accurate.

---

## STEP 1 — Collect Required Information (Manual Mode)

If no document was provided, ask the user for the following. Do NOT proceed without all required fields:

| Field | Example (MDC/MDX RoomSuite) | Required? |
|---|---|---|
| Product Name | MDC/MDX RoomSuite | ✅ |
| Product Abbreviation | RoomSuite | ✅ |
| Top-Level Bundle SKU | RS-MOD-BB | ✅ |
| Component SKUs | RMP-100, ACC-BL-KIT, QIO-VEN4 | ✅ |
| Extender SKU (standalone-sellable component) | QIO-VEN4 | ✅ |
| Regional Variant Suffixes | NA, EU, UK, AU, JP, CN, CH | ✅ |
| AMER/APAC OU | US OU | ✅ |
| EMEA OU | DE OU | ✅ |
| India/SAARC OU | IN OU | ✅ |
| Individual FGs for India OU | FG-901638-04, FG-901626-00, AG-000538-01 | ✅ |
| Separately-orderable accessories | RMP-RMK, POE-90W-PSU | Optional |
| Functional Council Tag | Sales Ops + Enablement | ✅ |
| CPQ PM Owner | Katie Chester | ✅ |
| Oracle PM Owner | Michelle Flynn | ✅ |
| Parent Initiative ID (if exists) | 1285166 | Optional |
| Target Iteration | Resolve from the live GTM Team iteration list | ✅ |

---

## STEP 2 — Review and Classify Before Creating

Before any work item is created, review the extracted or manually provided details and classify each potential item as one of the following:
- Create New
- Link to Existing
- Skip (already covered by an existing item)
- Needs Human Review

Use live ADO search results, the historical MDC/MDX pattern, and the user's answers to decide the label. If an item is a duplicate, already covered, or not clearly supported, do not create it yet. Show the classification and a short reason for each item; include only approved "Create New" items in the complete preview and approval request in Step 3.

---

## STEP 3 — Preview and Confirm Before Creating

Show the user the full proposed hierarchy:

```
Proposed Work Item Hierarchy:

Initiative: [PRODUCT_NAME] Product Launch
├── Epic 1 (GTM Team): [PRODUCT_NAME] - Quoting Enablement
│   └── Feature: [PRODUCT_ABBREV] CPQ Bundling
│       ├── PBI: Create [PRODUCT_ABBREV] Products & Pricebook Entries in QA - CPQ
│       ├── PBI: Translations for [PRODUCT_ABBREV] Products - CPQ
│       └── PBI: Create [PRODUCT_ABBREV] Bundles - CPQ
└── Epic 2 (GTM Team): [PRODUCT_NAME] - Order & Fulfillment Enablement
    └── Feature: [PRODUCT_ABBREV] Order Creation/Fulfillment - Oracle
        ├── PBI: [PRODUCT_NAME] - Order Creation/Fulfillment - AMER/APAC ([AMER_OU])
        ├── PBI: [PRODUCT_NAME] - Order Creation/Fulfillment - EMEA ([EMEA_OU])
        └── PBI: [PRODUCT_NAME] - Order Creation/Fulfillment - SAARC/INDIA ([IN_OU]) Individual FGs and AG
```

---

Before asking for approval, show the exact title, work item type, description, acceptance criteria, tags, assignee, priority, area, iteration, and parent link for every proposed item. Follow the GTM work-item formatting standard for every created item's description and acceptance criteria. Do not rely on the abbreviated hierarchy sketch above as the approval preview. Create nothing until the user explicitly approves the complete preview.

## STEP 4 — Create Work Items (in order, top-down)

Use the ADO tools to create each item. Set parent-child links immediately after creating each item.

### COMMON FIELDS (apply to all GTM Team items unless noted)
- Area Path: `Lyra\GTM Team`
- Iteration Path: `[TARGET_ITERATION]` resolved from the GTM Team's live iterations; do not construct the path from the example or guess it.
- Project: `Lyra`

---

### INITIATIVE (only if no existing initiative provided)

**Title:** `[PRODUCT_NAME] Product Launch`

**Fields:**
- Work Item Type: `Initiative`
- Area Path: `Lyra`
- Iteration Path: `[TARGET_ITERATION]` selected from live ADO iteration data and included in the approved preview.
- Tags: `[FUNCTIONAL_COUNCIL_TAG]`

---

### EPIC 1 — Quoting Enablement

**Title:** `[PRODUCT_NAME] - Quoting Enablement`

**Fields:**
- Work Item Type: `Epic`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[CPQ_PM_OWNER]`
- Priority: `1`
- Parent: `[INITIATIVE_ID]`
- Tags: `CPQ; Salesforce`

---

### EPIC 2 — Order & Fulfillment Enablement

**Title:** `[PRODUCT_NAME] - Order & Fulfillment Enablement`

**Fields:**
- Work Item Type: `Epic`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[ORACLE_PM_OWNER]`
- Priority: `1`
- Parent: `[INITIATIVE_ID]`
- Tags: `Oracle; [FUNCTIONAL_COUNCIL_TAG]`

---

### FEATURE A — CPQ Bundling (child of Epic 1)

**Title:** `[PRODUCT_ABBREV] CPQ Bundling`

**Fields:**
- Work Item Type: `Feature`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[CPQ_PM_OWNER]`
- Priority: `2`
- Parent: `[EPIC1_ID]`
- Tags: `CPQ`

**Description:**
```
Overview of Bundle:
- Top Item: [BUNDLE_SKU]
- Child Components (all included by default, no option to remove):
  - [COMPONENT_1]
  - [COMPONENT_2]
  - [EXTENDER_SKU] — The Extender.
    - Can be sold standalone, outside of the bundle.
    - Multiple extenders can be selected on the quote (but not within the bundle itself due to pricing).
    - Selecting additional standalone Extenders should NOT update the RoomSuite Bundle Quantity.

REGIONAL VARIANTS:
  - [BUNDLE_SKU]-[REGION_1]: [COMPONENT_1], [COMPONENT_2], [EXTENDER_SKU]
  - [BUNDLE_SKU]-[REGION_2]
  - ... (one per regional suffix)

Quote Template Rules:
- Should mimic VisionSuite + HW/SW bundling pattern using "included" on all component lines.
```

---

### FEATURE B — Order Creation/Fulfillment - Oracle (child of Epic 2)

**Title:** `[PRODUCT_ABBREV] Order Creation/Fulfillment - Oracle`

**Fields:**
- Work Item Type: `Feature`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[ORACLE_PM_OWNER]`
- Priority: `1`
- Parent: `[EPIC2_ID]`
- Tags: `Oracle; [FUNCTIONAL_COUNCIL_TAG]`

**Description:**
```
Test [PRODUCT_ABBREV] order fulfillment from order entry/GOP process through batch pick releases by Logistics for all regions and subsequent reporting, invoicing.

Dependency: Awaiting completion of Agile/Operations bundle configuration work item to test AMER/APAC/EMEA PTO Kits and IN Bundle.

Should mimic the VisionSuite + HW/SW bundling of using "included" on documentation.
```

---

### PBI 1 — Create Products & Pricebook Entries in QA (child of Feature A)

**Title:** `Create [PRODUCT_ABBREV] Products & Pricebook Entries in QA - CPQ`

**Fields:**
- Work Item Type: `Product Backlog Item`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[CPQ_PM_OWNER]`
- Parent: `[FEATURE_A_ID]`
- Tags: `CPQ; Salesforce`

**Description:**
```
As a CPQ administrator,
I want the [PRODUCT_ABBREV]-related products created in Salesforce (QA),
so that they can be used to configure the [PRODUCT_ABBREV] bundle.
```

**Acceptance Criteria:**
```
AC1: [BUNDLE_SKU] exists as a product record in QA
AC2: The following component products exist as product records in QA:
  a. [COMPONENT_1]
  b. [COMPONENT_2]
  c. [EXTENDER_SKU]
AC3: Regional Variants — the following regional SKUs exist as product records in QA:
  a. [BUNDLE_SKU]-[REGION_1]
  b. [BUNDLE_SKU]-[REGION_2]
  c. (one per regional suffix)
```

---

### PBI 2 — Translations for Products - CPQ (child of Feature A)

**Title:** `Translations for [PRODUCT_ABBREV] Products - CPQ`

**Fields:**
- Work Item Type: `Product Backlog Item`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[CPQ_PM_OWNER]`
- Parent: `[FEATURE_A_ID]`
- Tags: `CPQ; Salesforce`

**Description:**
```
As a CPQ administrator,
I want German translations created for [PRODUCT_ABBREV]-related products on the quote in Salesforce,
so that German-speaking users can view localized product information during quoting.
```

**Acceptance Criteria:**
```
AC1: German translations exist for the following product records in QA, on the quote record:
  a. [BUNDLE_SKU]
  b. [BUNDLE_SKU]-[REGION_1] ... (one per regional variant)
  c. [COMPONENT_1]
  d. [COMPONENT_2]
  e. [EXTENDER_SKU]
AC2: The following fields are translated into German:
  a. Model Description
AC3: When the Salesforce user language is set to German, the translated product values are displayed correctly in QA.
```

---

### PBI 3 — Create Bundles - CPQ (child of Feature A)

**Title:** `Create [PRODUCT_ABBREV] Bundles - CPQ`

**Fields:**
- Work Item Type: `Product Backlog Item`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[CPQ_PM_OWNER]`
- Parent: `[FEATURE_A_ID]`
- Tags: `CPQ; Salesforce`

**Description:** (same as Feature A description — bundle structure, variants, quote template rules)

**Acceptance Criteria:**
```
AC1: Bundle Setup
  a. [BUNDLE_SKU] is configured as a CPQ bundle product.
  b. The bundle includes the following option products:
     i. [COMPONENT_1]
     ii. [COMPONENT_2]
     iii. [EXTENDER_SKU]
AC2: Required Options
  a. All bundle options are automatically selected and required.
  b. Options cannot be deselected or removed from the bundle UI.
AC3: Option Quantity Locking
  a. Option quantities for all bundle components are read-only.
  b. Option quantities cannot be edited from the quote line editor or bundle configurator.
AC4: Extender Inclusion Rule
  a. [EXTENDER_SKU] is included exactly once within the bundle configuration.
  b. No option exists to add additional [EXTENDER_SKU] units inside the bundle.
AC5: Standalone Extender Support
  a. [EXTENDER_SKU] remains available as a standalone product.
  b. Standalone [EXTENDER_SKU] quantities are editable on the quote.
  c. Adding additional standalone [EXTENDER_SKU] items does NOT update the quantity of the [PRODUCT_ABBREV] bundle.
AC6: Regional SKU Parity
  a. All regional [PRODUCT_ABBREV] SKUs use the same bundle structure and option rules as [BUNDLE_SKU].
AC7: Bundle Feature
  a. The bundle feature is named "[PRODUCT_ABBREV] Bundle".
  b. All components are included in the one feature.
```

---

### PBI 4 — Order Creation/Fulfillment - AMER/APAC (child of Feature B)

**Title:** `[PRODUCT_NAME] - Order Creation/Fulfillment - AMER/APAC ([AMER_OU])`

**Fields:**
- Work Item Type: `Product Backlog Item`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[ORACLE_PM_OWNER]`
- Parent: `[FEATURE_B_ID]`
- Tags: `Oracle; Order Promise; [FUNCTIONAL_COUNCIL_TAG]`

**Description:**
```
Test PTO Kits for AMER/APAC region — order entry, booking, documentation, shipment, reporting.

Dependency: Awaiting completion of Agile bundle configuration (Operations) to test AMER/APAC PTO Kits.

Should mimic the VisionSuite + HW/SW bundling of using "included" on documentation.
```

**Acceptance Criteria:**
```
AC1: [BUNDLE_SKU]-XX (VARIANT) should be orderable as a PTO kit with the following part numbers showing as a roll-up in Oracle:
  a. FG for the [BUNDLE_SKU]-XX (VARIANT)
  b. [COMPONENT_1]
  c. [COMPONENT_2]
  d. [EXTENDER_SKU]
AC2: [SEPARATELY_ORDERABLE_ACCESSORIES] for the specific variant/region should be orderable separately.
```

---

### PBI 5 — Order Creation/Fulfillment - EMEA (child of Feature B)

**Title:** `[PRODUCT_NAME] - Order Creation/Fulfillment - EMEA ([EMEA_OU])`

**Fields:**
- Work Item Type: `Product Backlog Item`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[ORACLE_PM_OWNER]`
- Parent: `[FEATURE_B_ID]`
- Tags: `Oracle; Order Promise; [FUNCTIONAL_COUNCIL_TAG]`

**Description:** (same as PBI 4, scoped to EMEA)

**Acceptance Criteria:** (same as PBI 4, scoped to EMEA variant)

---

### PBI 6 — Order Creation/Fulfillment - SAARC/INDIA (child of Feature B)

**Title:** `[PRODUCT_NAME] - Order Creation/Fulfillment - SAARC/INDIA ([IN_OU]) Individual FGs and AG`

**Fields:**
- Work Item Type: `Product Backlog Item`
- Area Path: `Lyra\GTM Team`
- Assigned To: `[ORACLE_PM_OWNER]`
- Parent: `[FEATURE_B_ID]`
- Tags: `Oracle; Order Promise; [FUNCTIONAL_COUNCIL_TAG]`

**Description:**
```
End-to-end testing for SAARC/IN as individual components (NOT bundle/PTO Kit) — order entry, booking, documentation, shipment, reporting, RMAs.

Individual FGs:
  a. [INDIA_FG_1]
  b. [INDIA_FG_2]
  c. [INDIA_AG]

Dependency: Awaiting completion of Agile bundle configuration (Operations) to test IN Bundle.
```

**Acceptance Criteria:**
```
AC1: Parts are orderable, shippable, invoiceable, reportable and returnable individually:
  a. [INDIA_FG_1]
  b. [INDIA_FG_2]
  c. [INDIA_AG]
```

---

## STEP 5 — Report Summary

After all items are created, output a summary table:

```
## ✅ New Product Launch Work Items Created

| Type | ID | Title | Parent |
|------|----|-------|--------|
| Initiative | #XXXX | [PRODUCT_NAME] Product Launch | — |
| Epic | #XXXX | [PRODUCT_NAME] - Quoting Enablement | #Initiative |
| Epic | #XXXX | [PRODUCT_NAME] - Order & Fulfillment Enablement | #Initiative |
| Feature | #XXXX | [PRODUCT_ABBREV] CPQ Bundling | #Epic1 |
| Feature | #XXXX | [PRODUCT_ABBREV] Order Creation/Fulfillment - Oracle | #Epic2 |
| PBI | #XXXX | Create [PRODUCT_ABBREV] Products & Pricebook Entries in QA - CPQ | #FeatureA |
| PBI | #XXXX | Translations for [PRODUCT_ABBREV] Products - CPQ | #FeatureA |
| PBI | #XXXX | Create [PRODUCT_ABBREV] Bundles - CPQ | #FeatureA |
| PBI | #XXXX | [PRODUCT_NAME] - Order Creation/Fulfillment - AMER/APAC | #FeatureB |
| PBI | #XXXX | [PRODUCT_NAME] - Order Creation/Fulfillment - EMEA | #FeatureB |
| PBI | #XXXX | [PRODUCT_NAME] - Order Creation/Fulfillment - SAARC/INDIA | #FeatureB |
```

### 📋 Next Steps
1. Assign sprint iterations to each PBI in coordination with Michelle Flynn (Oracle) and Katie Chester (CPQ).
2. Link Operations backlog epic (Agile bundle configuration) as a dependency on Oracle PBIs 4–6.
3. If a price list update is needed in Oracle, create a Feature "[PRODUCT_ABBREV] Price Lists - Oracle" under Epic 2.
4. Confirm India OU individual FG part numbers with Jane Zhou before starting SAARC/IN PBI.
5. Add Germany translation requirements to PBI 2 for any additional languages beyond German.
