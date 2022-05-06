# Analyze Tool

Analyze tool will help you visualize the results of your performance tests through auto-generated graphs and csv files.

## How to use

### Line Graph
`RScript ./analyze.r $compare $filter $x $x_weights $x_title $x_labels $title $legend`

| Variable | Example | Comments |
|----------| :-----: | -------- |
| compare | `"tyk,kong"` | What your looking to compare. Accepts regex. |
| filter | `"rest,aws"` | Values to filter on. The result is an `AND` of the `,` separated fitler list. Accepts Regex. |
| x | `"t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge"` | The x-axis values to split the data on. Accepts Regex. |
| x_weights | `"2,4,8,16"` | The weights of the x-axis values. Length must match x list length. |
| x_title | `"Cores"` | x-axis title |
| x_labels | `"2,4,8,16"` | The labels of the x-axis values. Length must match x list length. |
| title | `"AWS Tyk vs Kong"` | Title of the auto-generated Graphs. |
| legend | `"Tyk,Kong"` | The labels of the legends. Length must match compare list length. |

#### Examples
```
RScript ./analyze.r \
  "tyk,kong" \
  "rest,aws" \
  "t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "AWS Tyk vs Kong" \
  "Tyk,Kong"
```

```
RScript ./analyze.r \
  "tyk-stitch-0,tyk-federate-0,tyk-stitch-1,tyk-federate-1,tyk-stitch-2,tyk-federate-2" \
  "gcp" \
  "e2-medium,c2-standard-4,c2-standard-8,c2-standard-16" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "GCP Stitch vs Federation" \
  "Stitch Depth-0,Federate Depth-0,Stitch Depth-1,Federate Depth-1,Stitch Depth-2,Federate Depth-2"
```

```
RScript ./analyze.r \
  "tyk-stitch-0,apollo-stitch-0,tyk-stitch-1,apollo-stitch-1,tyk-stitch-2,apollo-stitch-2" \
  "azure" \
  "Standard_B2s,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "Azure Tyk vs Apollo Stitch" \
  "Tyk Depth-0,Apollo Depth-0,Tyk Depth-1,Apollo Depth-1,Tyk Depth-2,Apollo Depth-2"
```

```
RScript ./analyze.r \
  "tyk-federate-0,apollo-federate-0,tyk-federate-1,apollo-federate-1,tyk-federate-2,apollo-federate-2" \
  "aws" \
  "t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge" "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "AWS Tyk vs Apollo Federation" \
  "Tyk Depth-0,Apollo Depth-0,Tyk Depth-1,Apollo Depth-1,Tyk Depth-2,Apollo Depth-2"
```

```
RScript ./analyze.r \
  "aws,gcp,azure" \
  "rest,tyk" \
  "t2.medium|e2-medium|Standard_B2s,c5.xlarge|c2-standard-4|Standard_F4s_v2,c5.2xlarge|c2-standard-8|Standard_F8s_v2,c5.4xlarge|c2-standard-16|Standard_F16s_v2" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "AWS vs GCP vs Azure REST" \
  "AWS,GCP,Azure"
```

```
RScript ./analyze.r \
  "aws-[1-5]-tyk,aws-[1-5]-kong,gcp-[1-5]-tyk,gcp-[1-5]-kong,azure-[1-5]-tyk,azure-[1-5]-kong" \
  "rest" \
  "t2.medium|e2-medium|Standard_B2s,c5.xlarge|c2-standard-4|Standard_F4s_v2,c5.2xlarge|c2-standard-8|Standard_F8s_v2,c5.4xlarge|c2-standard-16|Standard_F16s_v2" \
  "2,4,8,16" \
  "Cores" \
  "2,4,8,16" \
  "Tyk vs Kong on AWS vs GCP vs Azure REST" \
  "AWS-Tyk,AWS-Kong,GCP-Tyk,GCP-Kong,Azure-Tyk,Azure-Kong"
```

### Bar Graph
`RScript ./analyze.r $compare $filter $x $x_weights $x_title $x_labels $title $legend`

#### Examples
```
RScript ./analyze.r \
  "[1-3]-tyk-rest,[1-3]-auth-tyk-rest,[1-3]-analytics-tyk-rest,[1-3]-rate-tyk-rest,[1-3]-auth-quota-tyk-rest,[1-3]-auth-analytics-rate-quota-tyk-rest" \
  "aws" \
  "c5.4xlarge" \
  "16" \
  "Cores" \
  "16" \
  "Tyk Plugin Anlysis - AWS c5.4xlarge" \
  "Tyk,Auth,Analytics,Rate Limiting,Auth & Quota,All" \
  "bar"
```

```
RScript ./analyze.r \
  "[1-3]-tyk-rest,[1-3]-auth-tyk-rest,[1-3]-analytics-tyk-rest,[1-3]-rate-tyk-rest,[1-3]-auth-quota-tyk-rest,[1-3]-auth-analytics-rate-quota-tyk-rest" \
  "gcp" \
  "c2-standard-16" \
  "16" \
  "Cores" \
  "16" \
  "Tyk Plugin Anlysis - GCP c2-standard-16" \
  "Tyk,Auth,Analytics,Rate Limiting,Auth & Quota,All" \
  "bar"
```

```
RScript ./analyze.r \
  "[1-3]-tyk-rest,[1-3]-auth-tyk-rest,[1-3]-analytics-tyk-rest,[1-3]-rate-tyk-rest,[1-3]-auth-quota-tyk-rest,[1-3]-auth-analytics-rate-quota-tyk-rest" \
  "azure" \
  "Standard_F16s_v2" \
  "16" \
  "Cores" \
  "16" \
  "Tyk Plugin Anlysis - Azure Standard_F16s_v2" \
  "Tyk,Auth,Analytics,Rate Limiting,Auth & Quota,All" \
  "bar"
```
