Feature: Miscellaneous OpenJDK-related unit tests

  @opencollab-incubator/centos9-temurin-11
  @opencollab-incubator/centos9-temurin-11-runtime
  Scenario: Check that only OpenJDK 11 is installed
    When container is started with args
    | arg     | value   |
    | command | rpm -qa |
    Then available container log should not contain java
    Then available container log should not contain temurin-8
    Then available container log should not contain temurin-17
    Then available container log should not contain temurin-21

  @opencollab-incubator/centos9-temurin-17
  @opencollab-incubator/centos9-temurin-17-runtime
  Scenario: Check that only OpenJDK 17 is installed
    When container is started with args
    | arg     | value   |
    | command | rpm -qa |
    Then available container log should not contain java
    Then available container log should not contain temurin-8
    Then available container log should not contain temurin-11
    Then available container log should not contain temurin-21

  @opencollab-incubator/centos9-temurin-21
  @opencollab-incubator/centos9-temurin-21-runtime
  Scenario: Check that only OpenJDK 21 is installed
    When container is started with args
    | arg     | value   |
    | command | rpm -qa |
    Then available container log should not contain java
    Then available container log should not contain temurin-8
    Then available container log should not contain temurin-11
    Then available container log should not contain temurin-17

  @opencollab-incubator
  Scenario: Ensure JAVA_HOME is defined and contains Java
    When container is started with args
    | arg     | value                                  |
    | command | bash -c "$JAVA_HOME/bin/java -version" |
    Then available container log should contain OpenJDK Runtime Environment

  @opencollab-incubator
  Scenario: Check that certain non-UBI packages are not installed
    When container is started with args
    | arg     | value   |
    | command | rpm -qa |
    Then available container log should not contain grub
    Then available container log should not contain os-prober
    Then available container log should not contain rpm-plugin-systemd-inhibit

  @opencollab-incubator/centos9-temurin-11
  @opencollab-incubator/centos9-temurin-11-runtime
  Scenario: Check that directories from other JDKs are not present (JDK11)
    When container is started with args
    | arg     | value   |
    | command | ls -1 /usr/lib/jvm |
    Then available container log should not contain temurin-8
    Then available container log should not contain temurin-17
    Then available container log should not contain temurin-21
    Then available container log should not contain java

  @opencollab-incubator/centos9-temurin-17
  @opencollab-incubator/centos9-temurin-17-runtime
  Scenario: Check that directories from other JDKs are not present (JDK17)
    When container is started with args
    | arg     | value   |
    | command | ls -1 /usr/lib/jvm |
    Then available container log should not contain temurin-8
    Then available container log should not contain temurin-11
    Then available container log should not contain temurin-21
    Then available container log should not contain java

  @opencollab-incubator/centos9-temurin-21
  @opencollab-incubator/centos9-temurin-21-runtime
  Scenario: Check that directories from other JDKs are not present (JDK21)
    When container is started with args
    | arg     | value   |
    | command | ls -1 /usr/lib/jvm |
    Then available container log should not contain temurin-8
    Then available container log should not contain temurin-11
    Then available container log should not contain temurin-17
    Then available container log should not contain java

  @opencollab-incubator
  Scenario: Ensure LANG is defined and contains UTF-8
    When container is started with args
    | arg     | value                                  |
    | command | bash -c "$JAVA_HOME/bin/java -XshowSettings:properties -version" |
    Then available container log should contain file.encoding = UTF-8

  @opencollab-incubator
  Scenario: Ensure tar is installed (OPENJDK-1165)
    When container is started with args
    | arg     | value |
    | command | tar   |
    Then available container log should not contain command not found

  @opencollab-incubator
  Scenario: Ensure tzdata RPM is properly installed (OPENJDK-2519)
    When container is started with args
    | arg     | value         |
    | command | rpm -V tzdata |
    Then available container log should not contain missing
