# Day 67: AWS S3 Bucket Creation and Management

### What is AWS S3 Bucket?

- **Amazon Simple Storage Service** (Amazon S3) is an `object storage service` offering industry-leading **scalability**, **data availability**, **security**, and **performance**. Customers of all sizes and industries can store and protect any amount of data for virtually any use case, such as `data lakes`, `cloud-native applications`, and `mobile apps`.
- With **cost-effective storage classes** and **easy-to-use management features**, you can `optimize costs`, `organize data`, and configure fine-tuned access controls to meet specific business, organizational, and compliance requirements.

![product-page-diagram_Amazon-S3_HIW@2x ee85671fe5c9ccc2ee5c5352a769d7b03d7c0f16](https://github.com/Rohit312001/GitDemo/assets/76991475/446ce8b5-d607-42ed-8908-c64650636669)

### What is Object Storage?

- **Object storage** is a **data storage architecture** that manages data as objects, as opposed to other storage architectures like file systems which manage data as a file hierarchy and block storage which manages data as `blocks` within sectors and tracks.
- Each object typically includes the data itself, a variable amount of metadata, and a globally unique identifier. Object storage can be implemented at multiple levels, including the device level (object storage device), the system level, and the interface level.
- In each case, object storage seeks to enable capabilities not addressed by other storage architectures, like interfaces that can be directly programmable by the application, a namespace that can span multiple instances of physical hardware, and data management functions like data replication and data distribution at object-level granularity.

# Task-01

### Create an S3 bucket using Terraform.

- **Step-01:** First create a main.tf with proper Provider and Region details and then create a S3 bucket resource with name `devopsbucket123xyz`

```hcl
provider "aws" {
  access_key = "AKIAQLUGEJSRZT6DM2FJ"
  secret_key = "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"
  region     = "ap-south-1"
}
resource "aws_s3_bucket" "devops_name_bucket_1" {
  bucket = "devopsbucket123xyz"
}

```

![Screenshot from 2023-10-09 23-01-25](https://github.com/Rohit312001/GitDemo/assets/76991475/b0e049e0-1f72-48cf-881c-f329f3997205)

- **In this Terraform Code:**

- The **provider** block specifies the AWS provider configuration. It includes your AWS access key, secret key, and the AWS region you want to use. Make sure to keep your access key and secret key secure and do not share them publicly.

- The **resource** block defines an AWS S3 bucket resource named `"devops_name_bucket_1"` and sets the desired bucket name to `"devopsbucket123xyz"`.

- **Step-02:** Initialize Terraform

```t
terraform init
```

![Screenshot from 2023-10-09 23-01-32](https://github.com/Rohit312001/GitDemo/assets/76991475/990a7cc8-9722-4c44-ad91-e6f3865723f2)

- **Step-03:** Now apply the Terraform Code

```t
terraform apply
```

![Screenshot from 2023-10-09 23-02-14](https://github.com/Rohit312001/GitDemo/assets/76991475/1d85415c-8760-439a-91df-c52371348a6e)

- **Step-04:** Now go to AWS Console and check the **S3 bucket**.

![Screenshot from 2023-10-09 23-06-14](https://github.com/Rohit312001/GitDemo/assets/76991475/58b9ccac-4b1b-4524-a79e-b455ccf5703d)

---

### Configure the bucket to allow public read access.

- **Step-01:** Now create a new file named as "public_access.tf" and add the following code in it.

```hcl
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.devops_name_bucket_1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.devops_name_bucket_1.id
  acl    = "public-read"
}
```

![Screenshot from 2023-10-09 23-12-14](https://github.com/Rohit312001/GitDemo/assets/76991475/461d1b13-8285-49dd-a786-1a47b41ee1ae)

- **In this Terraform Code:**

- The **aws_s3_bucket_public_access_block** resource creates a configuration for controlling public access to the `"devops_name_bucket_1"` S3 bucket. You have specified that **public ACLs**, **public policies**, and **public bucket** access should not be blocked.

- The **aws_s3_bucket_acl** resource defines an `Access Control List (ACL)` for the `"devops_name_bucket_1"` S3 bucket, setting it to `"public-read."` This configuration allows **public read access** to objects in the bucket.

- **Step-02:** Now go to **bucket > permissions > edit object permissions** and make `ACLs enabled`.

![Screenshot from 2023-10-09 23-34-09](https://github.com/Rohit312001/GitDemo/assets/76991475/7ded1489-197e-4904-bb6a-f372d0b985b8)

- **Step-03:** Now apply the Terraform Code

```t
terraform apply
```

![Screenshot from 2023-10-09 23-35-54](https://github.com/Rohit312001/GitDemo/assets/76991475/4520737e-a5fe-4a23-98dc-c49efa879f8e)

- **Step-04:** Now go to AWS Console and check the **S3 bucket** , as it should be public now.

![Screenshot from 2023-10-09 23-37-48](https://github.com/Rohit312001/GitDemo/assets/76991475/1bf3c23e-cca8-4468-946e-57da865716d2)

---

### Create an S3 bucket policy that allows read-only access to a specific IAM user or role.

- **Step-01:** Now create a new file named as "IAM_access.tf" and add the following code in it.

```hcl
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.devops_name_bucket_1.id
  policy = data.aws_iam_policy_document.allow_read_only_access.json
}

data "aws_iam_policy_document" "allow_read_only_access" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["024977362083"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.devops_name_bucket_1.arn,
      "${aws_s3_bucket.devops_name_bucket_1.arn}/*",
    ]
  }
}
```

![Screenshot from 2023-10-10 00-14-02](https://github.com/Rohit312001/GitDemo/assets/76991475/c3a51ff1-6b1b-4f7a-bdd2-17284a010630)

- In this code we also need to add the **AWS Account ID** in the **identifiers** section.

![Screenshot from 2023-10-10 00-02-56](https://github.com/Rohit312001/GitDemo/assets/76991475/6e514c26-c14f-4d2e-8f9b-45d2cb88e2bc)

- **In this Terraform Code:**

- The **aws_s3_bucket_policy** resource attaches a policy to the `"devops_name_bucket_1"` S3 bucket. It uses the policy defined in the **data block**.

- The data **"aws_iam_policy_document"** block defines an IAM policy document named **"allow_read_only_access."** This policy allows read-only access to the specified AWS account ID for the `S3 bucket` and its `objects`.

- **Step-02:** Now apply the Terraform Code

```t
terraform apply
```

![Screenshot from 2023-10-10 00-14-28](https://github.com/Rohit312001/GitDemo/assets/76991475/471de50a-de6b-4218-94e2-976e1bd3e287)

- **Step-03:** Now go to AWS Console and check the **S3 bucket policy**

![Screenshot from 2023-10-10 00-16-03](https://github.com/Rohit312001/GitDemo/assets/76991475/eb0a87ba-f641-469d-a5c4-2d017af280a3)

---

### Enable versioning on the S3 bucket.

- **Step-01:** Now create a new file named as "versioning.tf" and add the following code in it.

```hcl
resource "aws_s3_bucket" "my_bucket_versioning" {
  bucket = aws_s3_bucket.devops_name_bucket_1.id

  versioning {
    enabled = true
  }
}
```

- **In this Terraform Code:**

- We create a resource of type aws_s3_bucket named "my_bucket_versioning."
- We specify the name of the existing S3 bucket "devops_name_bucket_1" in the bucket attribute.
- We enable versioning for the existing bucket using the versioning block.

- **Step-02:** Check the **AWS S3 bucket** versioning settings.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/db9a9f22-ef8e-41bc-b456-f57b933f433c)

---

## Happy Terraforming:)
