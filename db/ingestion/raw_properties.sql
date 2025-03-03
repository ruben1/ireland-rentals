copy "ireland-rentals".public.raw_properties
from 's3://import-property-enumeration/'
iam_role 'arn:aws:iam::639408663670:role/ireland-rentals-production-redshift-serverless-role'
json 's3://import-property-enumeration/properties_jsonpath.json'; 