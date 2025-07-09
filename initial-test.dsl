workspace {
  model {
    user = person "User"
    testSystem = softwareSystem "Test System" {
      user -> this "Tests"
    }
  }

  views {
    systemContext testSystem {
      include *
      autolayout lr
    }
  }
}