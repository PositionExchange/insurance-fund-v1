interface IGeneralNFTReward {
    function _periodFinish() external view returns (uint256);
    function notifyReward(uint256 reward) external;
    function setGovernance(address governance) external;
    function setTeamRewardRate( uint256 teamRewardRate ) external;
    function setPoolRewardRate( uint256  poolRewardRate ) external;
    function setHarvestInterval( uint256  harvestInterval ) external;
    function setRewardPool( address  rewardPool ) external;
    function setTeamWallet( address teamwallet ) external;
    function setWithDrawPunishTime( uint256  punishTime ) external;
    function setMaxStakedDego(uint256 amount) external;
}