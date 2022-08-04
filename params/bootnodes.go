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
	"enode://02e66aa2db658272c95668a65fcc6f0260248679bb35681fe4ae8ff47b61c9321b7f307ee3b83a9b2766e4ada3738950941805a497d71fe65336736af33412c5@13.250.3.60:32668",
	"enode://eff16b706253b7e0568be1d957beac97934299b825f001f6e37655efd342b1abfb34bba96a29cf809bc46a6c138756e2584f0a28e4f2461ec617d45e1e14db95@13.213.3.18:32668",
}

// TestnetBootnodes are the enode URLs of the P2P bootstrap nodes running on the
var TestnetBootnodes = []string{
	"enode://02e66aa2db658272c95668a65fcc6f0260248679bb35681fe4ae8ff47b61c9321b7f307ee3b83a9b2766e4ada3738950941805a497d71fe65336736af33412c5@13.250.3.60:32668",
	"enode://eff16b706253b7e0568be1d957beac97934299b825f001f6e37655efd342b1abfb34bba96a29cf809bc46a6c138756e2584f0a28e4f2461ec617d45e1e14db95@13.213.3.18:32668",
}

var V5Bootnodes = []string{}

// KnownDNSNetwork returns the address of a public DNS-based node list for the given
// genesis hash and protocol. See https://github.com/ethereum/discv4-dns-lists for more
// information.
func KnownDNSNetwork(genesis common.Hash, protocol string) string {
	return ""
}
