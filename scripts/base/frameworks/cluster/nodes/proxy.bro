##! Redefines the options common to all proxy nodes within a Bro cluster.
##! In particular, proxies are not meant to produce logs locally and they
##! do not forward events anywhere, they mainly synchronize state between
##! worker nodes.

@prefixes += cluster-proxy

## The proxy only syncs state; does not forward events.
redef forward_remote_events = F;
redef forward_remote_state_changes = T;

## Don't do any local logging.
redef Log::enable_local_logging = F;

## Make sure that remote logging is enabled.
redef Log::enable_remote_logging = T;

redef Log::default_rotation_interval = 24hrs;

## Use the cluster's delete-log script.
redef Log::default_rotation_postprocessor_cmd = "delete-log";


event Cluster::test_proxy_event()
	{
	print Cluster::node, ": WUUUUHUUU WOOORK";
	event Cluster::test_proxy_response(fmt("it was really hard - %s", Cluster::node));
	}
