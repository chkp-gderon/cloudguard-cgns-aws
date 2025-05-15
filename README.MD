Check Point CloudGuard PoC / PoV in AWS

(C) Check Point. Private and confidential.  

See: 
1. https://github.com/CheckPointSW/CloudGuardIaaS.git 

Accept marketplace terms: https://aws.amazon.com/marketplace/pp?sku=263gtcd87e2xefwbacsdwvorx 

1 - networking creates spoke VPC's, 
    ssh key, 
    security VPC, GWLB and ASG (together), 
    access VPC, 
    TGW, attachments, and route tables. 
    Spoke route rables, 
    SMS (until Smart-1 Cloud works), 
#   Ingress VPC, 
#   GWLBe and ingress routing in ingress VPC. 
    Second security VPC. 
        https://support.checkpoint.com/results/sk/sk111013 
            https://cgi-cfts.s3.amazonaws.com/gwlb/gwlb.yaml 

<!-- 2 - CME for Azure and AWS, STALLED
    AWS IAM roles,
    and a few network objects.  -->

3 - VM's
    Access VM's
    Spoke1 VM's
    Spoke2 VM's
    
