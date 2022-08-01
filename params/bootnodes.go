// Copyright 2015 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package params

import "github.com/DxChainNetwork/dxc/common"

// MainnetBootnodes are the enode URLs of the P2P bootstrap nodes running on
// the main Ethereum network.
var MainnetBootnodes = []string{
	// "enode://f6e715cdacbaf28538aa93dbbd16c230bcdd0d1b055d56b6f155c50bc3b5f190ac48262a36e0e3fd62ec5c8ba10d994f445f33a501024d0266c55469dc7ee811@18.138.236.38:32668",
	// "enode://ae9851d51ed679525ffed1d43c72b5f44dad81ffd47765786fbbf69af5d69c4bdba2fca0afc5599776edebc77dc62f2ee1c8b24664c0b0c8a58e897cad2260ed@13.214.153.30:32668",
	// "enode://453a18b5c4fbd42d7cdade693304c5138c646af2684e44ba7e378e5d163913133557ac6e38bb0cff432036f01a057b14738325ca48271ea9797ffe9b9829fd62@13.212.159.171:32668",
	"enode://d7417b707e66df7e4b2e964017e44c8e4f558291cf8a97057f352b03599b534ee4bf3ea4ff5d961af91f177ff1350b1ec5050098003aca69817ad481863970dc@13.250.3.60:32668",
	"enode://35eeea8d37c51f5c92ae70063ce89fb7b2f1975196ce251f70b6669a30a123cf30f9c6578a57b8f1313fe90d1074cd1880deaaade148b88965e4423e61777eb4@13.213.3.18:32668",
}

// TestnetBootnodes are the enode URLs of the P2P bootstrap nodes running on the
var TestnetBootnodes = []string{
	//"enode://0e169628b4e0c0a47fcce0d3c14fc9a98f925889261a38528a25ffa02ea75e65a77fc385b42787fc69e51eabbab3de83803023172114c4597644206741fc1bce@13.250.3.60:32668",
	//"enode://3616d283b8cda6f096ab204294413c4abcd18f38de6e754c5407baed8cce7f3c88950f002330872d55added8b03aae70fac140190628f1784ebec3313a68181d@13.213.3.18:32668",
}

var V5Bootnodes = []string{}

// KnownDNSNetwork returns the address of a public DNS-based node list for the given
// genesis hash and protocol. See https://github.com/ethereum/discv4-dns-lists for more
// information.
func KnownDNSNetwork(genesis common.Hash, protocol string) string {
	return ""
}
