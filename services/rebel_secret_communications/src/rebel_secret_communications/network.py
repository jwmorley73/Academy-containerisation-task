"""Network Utils for finding host ip and network
"""
import socket
import ipaddress

import psutil


def get_default_network_ip() -> str:
    """Returns the hosts ip address for the default network

    Returns:
        str: The host ip address
    """
    return socket.gethostbyname(socket.gethostname())

def get_network(
    target_ip: str | None = None
) -> ipaddress.IPv4Network | ipaddress.IPv6Network:
    """Trys to find the network for the provided IP address.

    Will look through the NICs for a network that contains the IP address. 
    Will return the found network. 

    Args:
        target_ip (str | None, optional): Target IP. Defaults to None,
            which will use the host ip on the default network.

    Raises:
        ValueError: If the network could not be found.

    Returns:
        ipaddress.IPv4Network | ipaddress.IPv6Network: The found network.
    """
    # Get host ip for the default network if not provided
    if target_ip is None:
        target_ip = get_default_network_ip()

    target = ipaddress.ip_address(target_ip)

    # Find network from NICs
    nics = psutil.net_if_addrs()
    for nic in nics.values():
        # Multiple addresses can be attached to the same NIC
        for nic_address in nic:
            family = nic_address.family
            address = nic_address.address
            mask = nic_address.netmask

            # Set mask to represent a single ip network if None
            if mask is None:
                if family is socket.AF_INET:
                    mask = "32"
                elif family is socket.AF_INET6:
                    mask = "128"
                else:
                    # Not an IP address (MAC address etc.)
                    continue

            network = ipaddress.ip_network(f"{address}/{mask}", strict=False)

            if target in network:
                return network

    raise ValueError(f"Could not find network for ip address: {target_ip}")
