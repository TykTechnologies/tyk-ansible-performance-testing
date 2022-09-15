#!/bin/bash
set -e

RScript ./analyze.r \
  "vanilla-tyk-rest,auth-tyk-rest,analytics-tyk-rest,rate-limiting-tyk-rest,auth-quota-tyk-rest,all-tyk-rest" \
  "aws" \
  "c5.4xlarge" \
  "16" \
  "Cores" \
  "16" \
  "Tyk Plugin Anlysis on AWS c5.4xlarge -" \
  "Tyk,Auth,Analytics,Rate Limiting,Auth & Quota,All" \
  "bar"

RScript ./analyze.r \
  "vanilla-tyk-rest,auth-tyk-rest,analytics-tyk-rest,rate-limiting-tyk-rest,auth-quota-tyk-rest,all-tyk-rest" \
  "gcp" \
  "c2d-standard-16" \
  "16" \
  "Cores" \
  "16" \
  "Tyk Plugin Anlysis on GCP c2d-standard-16 -" \
  "Tyk,Auth,Analytics,Rate Limiting,Auth & Quota,All" \
  "bar"

RScript ./analyze.r \
  "vanilla-tyk-rest,auth-tyk-rest,analytics-tyk-rest,rate-limiting-tyk-rest,auth-quota-tyk-rest,all-tyk-rest" \
  "azure" \
  "Standard_F16s_v2" \
  "16" \
  "Cores" \
  "16" \
  "Tyk Plugin Anlysis on Azure Standard_F16s_v2 -" \
  "Tyk,Auth,Analytics,Rate Limiting,Auth & Quota,All" \
  "bar"

RScript ./analyze.r \
  "all-tyk-rest" \
  "aws" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Machine type" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "Tyk on AWS - Fully Loaded REST -" \
  "Tyk"

RScript ./analyze.r \
  "all-tyk-rest" \
  "gcp" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "2,4,8,16" \
  "Machine type" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "Tyk on GCP - Fully Loaded REST -" \
  "Tyk"

RScript ./analyze.r \
  "all-tyk-rest" \
  "azure" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Machine type" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "Tyk on Azure - Fully Loaded REST -" \
  "Tyk"

RScript ./analyze.r \
  "vanilla-tyk,vanilla-kong" \
  "rest,aws" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Machine type" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "Tyk vs Kong on AWS - Vanilla REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "vanilla-tyk,vanilla-kong" \
  "rest,gcp" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "2,4,8,16" \
  "Machine type" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "Tyk vs Kong on GCP - Vanilla REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "vanilla-tyk,vanilla-kong" \
  "rest,azure" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Machine type" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "Tyk vs Kong on Azure - Vanilla REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "auth-tyk,auth-kong" \
  "rest,aws" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Machine type" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "Tyk vs Kong on AWS - Auth REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "auth-tyk,auth-kong" \
  "rest,gcp" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "2,4,8,16" \
  "Machine type" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "Tyk vs Kong on GCP - Auth REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "auth-tyk,auth-kong" \
  "rest,azure" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Machine type" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "Tyk vs Kong on Azure - Auth REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "rate-limiting-tyk,rate-limiting-kong" \
  "rest,aws" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Machine type" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "Tyk vs Kong on AWS - Rate Limiting REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "rate-limiting-tyk,rate-limiting-kong" \
  "rest,gcp" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "2,4,8,16" \
  "Machine type" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "Tyk vs Kong on GCP - Rate Limiting REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "rate-limiting-tyk,rate-limiting-kong" \
  "rest,azure" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Machine type" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "Tyk vs Kong on Azure - Rate Limiting REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "auth-quota-tyk,auth-quota-kong" \
  "rest,aws" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Machine type" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "Tyk vs Kong on AWS - Auth & Quota REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "auth-quota-tyk,auth-quota-kong" \
  "rest,gcp" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "2,4,8,16" \
  "Machine type" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "Tyk vs Kong on GCP - Auth & Quota REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "auth-quota-tyk,auth-quota-kong" \
  "rest,azure" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Machine type" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "Tyk vs Kong on Azure - Auth & Quota REST -" \
  "Tyk,Kong"

RScript ./analyze.r \
  "tyk-stitch-0,tyk-stitch-1,tyk-stitch-2,apollo-stitch-0,apollo-stitch-1,apollo-stitch-2" \
  "aws" \
  "c5.large,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "Tyk vs Apollo on AWS - REST Stitching -" \
  "Tyk Depth 0,Tyk Depth 1,Tyk Depth 2,Apollo Depth 0,Apollo Depth 1,Apollo Depth 2"

RScript ./analyze.r \
  "tyk-stitch-0,tyk-stitch-1,tyk-stitch-2,apollo-stitch-0,apollo-stitch-1,apollo-stitch-2" \
  "gcp" \
  "e2-standard-2,c2d-standard-4,c2d-standard-8,c2d-standard-16" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "Tyk vs Apollo on GCP - REST Stitching -" \
  "Tyk Depth 0,Tyk Depth 1,Tyk Depth 2,Apollo Depth 0,Apollo Depth 1,Apollo Depth 2"

RScript ./analyze.r \
  "tyk-stitch-0,tyk-stitch-1,tyk-stitch-2,apollo-stitch-0,apollo-stitch-1,apollo-stitch-2" \
  "azure" \
  "Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "Tyk vs Apollo on Azure - REST Stitching -" \
  "Tyk Depth 0,Tyk Depth 1,Tyk Depth 2,Apollo Depth 0,Apollo Depth 1,Apollo Depth 2"
