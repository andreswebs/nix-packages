{
  # services.dnclient (defined.net Managed Nebula enrollment via dn-tool).
  # Requires this repo's `dn-tool` overlay for the default package to resolve.
  dnclient = import ./dnclient;
}
