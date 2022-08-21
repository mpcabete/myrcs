#! /bin/sh
echo "creating"
A="lqOl:SA-SAOPAULO-1-AD-1"
C="ocid1.tenancy.oc1..aaaaaaaaoy3q2cfpqazki43qrh4fqzmi2i4qnioodzpwxfzt2xa4l2msi3fq"
S="ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaatswdmpsxlj542n5alxuz3b75mm3ajwqsgsfyisp3xgdojnindh5q"
I="ocid1.image.oc1.sa-saopaulo-1.aaaaaaaafl5tljzvlebqvrgs4nog6mg7n6indhgd6lzdxmtunsey735htmfa"
INSTANCE_OPTIONS='{"areLegacyImdsEndpointsDisabled":false}'
AVAILABILITY_CONFIG='{"recoveryAction":"RESTORE_INSTANCE"}'
SHAPE_CONFIG='{"ocpus":4,"memoryInGBs":24}'
# SOURCE_DETAILS='{"boot_volume_size_in_gbs":"50","boot_volume_vpus_per_gb":"20","source_id":"ocid1.image.oc1.sa-saopaulo-1.aaaaaaaafl5tljzvlebqvrgs4nog6mg7n6indhgd6lzdxmtunsey735htmfa","source_type":"image"}'

# oci network subnet list --compartment-id=$C
# oci iam availability-domain list --all --compartment-id=$C
# oci compute shape list --compartment-id=$C # list compartiments
#oci compute image list  --compartment-id=$C --shape=VM.Standard.A1.Flex #list images


 /home/mpkbt/bin/oci compute instance launch \
  --availability-domain $A \
  --compartment-id $C \
  --shape VM.Standard.A1.Flex \
  --subnet-id $S \
  --assign-private-dns-record true \
  --assign-public-ip true \
  --availability-config $AVAILABILITY_CONFIG \
  --display-name my-new-instance \
  --instance-options $INSTANCE_OPTIONS \
  --shape-config $SHAPE_CONFIG \
  --image-id $I \
  --ssh-authorized-keys-file /home/mpkbt/.ssh/nova.pub

  # --source-details $SOURCE_DETAILS \

# file:///home/mpkbt/myrcs/scripts/instance-options/availabilityConfig.json
# file:///home/mpkbt/myrcs/scripts/instance-options/instanceOptions.json
# file:///home/mpkbt/myrcs/scripts/instance-options/shapeConfig.json
