@opencollab-incubator/centos9-temurin-11
@opencollab-incubator/centos9-temurin-17
@opencollab-incubator/centos9-temurin-21
Feature: Openshift S2I tests
  Scenario: Check networkaddress.cache.negative.ttl has been set correctly
    Given s2i build https://github.com/rh-openjdk/openjdk-container-test-applications.git from binary-cli-security-property
    Then s2i build log should contain networkaddress.cache.negative.ttl=0
