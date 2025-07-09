workspace {
  model {
    user = person "User"

    cup = softwareSystem "AWS Cognito User Pool (CUP)"

    s3 = softwareSystem "AWS Simple Storage Service (S3)"

    portfolioSite = softwareSystem "Connor's Portfolio Site" {
      ui = container "UI" {
        technology "React, Next.js, S3, CloudFront"
      }

      lambda = container "Content API (AWS Lambda)"

      user -> ui "Uses"
      ui -> lambda "Calls"
      ui -> cup "SSO Authentication"
      lambda -> s3 "Reads Portfolio Content"
    }
  }

  views {
    systemContext portfolioSite {
      include user
      include portfolioSite
      include cup
      include s3
      autolayout tb
    }

    container portfolioSite {
      include *
      autolayout lr
    }
  }
}
