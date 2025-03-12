Feature: Tests for all openshift images

  @opencollab-incubator
  Scenario: Check that common labels are correctly set
    Given image is built
    # UBI base image versions are the RHEL version, e.g. "9.2", whereas all of
    # our image versions (so far) have been 1.x
    Then the image should contain label version containing value 1.
    And the image should contain label name containing value temurin

  # builder-only test
  @opencollab-incubator/centos9-temurin-11
  @opencollab-incubator/centos9-temurin-17
  @opencollab-incubator/centos9-temurin-21
  Scenario: Check that builder labels are correctly set
    Given image is built
    Then the image should contain label io.openshift.s2i.scripts-url with value image:///usr/local/s2i
