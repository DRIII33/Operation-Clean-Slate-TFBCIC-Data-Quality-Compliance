-- Initial Data Discovery: Baseline metrics and distribution
SELECT
    COUNT(policy_id) AS total_records,
    COUNT(DISTINCT policy_id) AS unique_policies,
    COUNTIF(tdi_reason_code IS NULL) AS missing_reason_codes,
    COUNTIF(property_zip_code IS NULL OR LENGTH(property_zip_code) != 5) AS invalid_zip_formats,
    COUNTIF(action_effective_date < effective_date) AS chronological_errors,
    ROUND((COUNT(DISTINCT policy_id) / COUNT(policy_id)) * 100, 2) AS uniqueness_ratio
FROM `tfbcic_ud.hb2067_raw`;
