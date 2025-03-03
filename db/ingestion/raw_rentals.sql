copy "ireland-rentals".public.rentals
from 's3://rentals-import/transformed/' 
iam_role 'arn:aws:iam::639408663670:role/ireland-rentals-production-redshift-serverless-role'
json 'auto ignorecase';