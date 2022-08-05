RScript ./analyze.r \
  "[1-3]-vanilla-tyk-rest,[1-3]-auth-tyk-rest,[1-3]-analytics-tyk-rest,[1-3]-rate-limiting-tyk-rest,[1-3]-auth-quota-tyk-rest,[1-3]-all-tyk-rest" \
  "aws" \
  "c5.4xlarge" \
  "16" \
  "Cores" \
  "16" \
  "Tyk Plugin Anlysis on AWS c5.4xlarge -" \
  "Tyk,Auth,Analytics,Rate Limiting,Auth & Quota,All" \
  "bar"

RScript ./analyze.r \
  "[1-3]-vanilla-tyk-rest,[1-3]-auth-tyk-rest,[1-3]-analytics-tyk-rest,[1-3]-rate-limiting-tyk-rest,[1-3]-auth-quota-tyk-rest,[1-3]-all-tyk-rest" \
  "gcp" \
  "c2-standard-16" \
  "16" \
  "Cores" \
  "16" \
  "Tyk Plugin Anlysis on GCP c2-standard-16 -" \
  "Tyk,Auth,Analytics,Rate Limiting,Auth & Quota,All" \
  "bar"

RScript ./analyze.r \
  "[1-3]-vanilla-tyk-rest,[1-3]-auth-tyk-rest,[1-3]-analytics-tyk-rest,[1-3]-rate-limiting-tyk-rest,[1-3]-auth-quota-tyk-rest,[1-3]-all-tyk-rest" \
  "azure" \
  "Standard_F16s_v2" \
  "16" \
  "Cores" \
  "16" \
  "Tyk Plugin Anlysis on Azure Standard_F16s_v2 -" \
  "Tyk,Auth,Analytics,Rate Limiting,Auth & Quota,All" \
  "bar"

RScript ./analyze.r \
  "tyk" \
  "rest,aws" \
  "t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Machine type" \
  "t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "Tyk on AWS - Vanilla REST -" \
  "Tyk"

RScript ./analyze.r \
  "tyk" \
  "rest,gcp" \
  "e2-medium,c2-standard-4,c2-standard-8,c2-standard-16" \
  "2,4,8,16" \
  "Machine type" \
  "e2-medium,c2-standard-4,c2-standard-8,c2-standard-16" \
  "Tyk on GCP - Vanilla REST -" \
  "Tyk"

RScript ./analyze.r \
  "tyk" \
  "rest,azure" \
  "Standard_B2s,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Machine type" \
  "Standard_B2s,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "Tyk on Azure - Vanilla REST -" \
  "Tyk"

RScript ./analyze.r \
  "tyk,kong" \
  "rest,aws" \
  "t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Machine type" \
  "t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "Tyk vs Kong on AWS - Vanilla REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "tyk,kong" \
  "rest,gcp" \
  "e2-medium,c2-standard-4,c2-standard-8,c2-standard-16" \
  "2,4,8,16" \
  "Machine type" \
  "e2-medium,c2-standard-4,c2-standard-8,c2-standard-16" \
  "Tyk vs Kong on GCP - Vanilla REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "tyk,kong" \
  "rest,azure" \
  "Standard_B2s,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Machine type" \
  "Standard_B2s,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "Tyk vs Kong on Azure - Vanilla REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "tyk-stitch-0,tyk-stitch-1,tyk-stitch-2,apollo-stitch-0,apollo-stitch-1,apollo-stitch-2" \
  "aws" \
  "t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "Tyk vs Apollo on AWS - REST Stitching -" \
  "Tyk Depth 0,Tyk Depth 1,Tyk Depth 2,Apollo Depth 0,Apollo Depth 1,Apollo Depth 2"

RScript ./analyze.r \
  "tyk-stitch-0,tyk-stitch-1,tyk-stitch-2,apollo-stitch-0,apollo-stitch-1,apollo-stitch-2" \
  "gcp" \
  "e2-medium,c2-standard-4,c2-standard-8,c2-standard-16" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "Tyk vs Apollo on GCP - REST Stitching -" \
  "Tyk Depth 0,Tyk Depth 1,Tyk Depth 2,Apollo Depth 0,Apollo Depth 1,Apollo Depth 2"

RScript ./analyze.r \
  "tyk-stitch-0,tyk-stitch-1,tyk-stitch-2,apollo-stitch-0,apollo-stitch-1,apollo-stitch-2" \
  "azure" \
  "Standard_B2s,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "Tyk vs Apollo on Azure - REST Stitching -" \
  "Tyk Depth 0,Tyk Depth 1,Tyk Depth 2,Apollo Depth 0,Apollo Depth 1,Apollo Depth 2"
