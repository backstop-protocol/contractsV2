/**
 * Copyright 2017-2020, bZeroX, LLC. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0.
 */

pragma solidity >=0.5.0 <=0.8.4;
pragma experimental ABIEncoderV2;

interface IStaking {


    struct AltRewardsUserInfo {
        uint256 rewardsPerShare;
        uint256 pendingRewards;
    }

    function pendingSushiRewards(address _user)
        external
        view
        returns (uint256);

    function getCurrentFeeTokens()
        external
        view
        returns (address[] memory);

    function maxUniswapDisagreement()
        external
        view
        returns (uint256);

    //Temporary, will remove it after migrationn
    function stakingRewards(address)
        external
        view
        returns (uint256);

    function isPaused()
        external
        view
        returns (bool);

    function fundsWallet()
        external
        view
        returns (address);


    function callerRewardDivisor()
        external
        view
        returns (uint256);


    function maxCurveDisagreement()
        external
        view
        returns (uint256);

    function rewardPercent()
        external
        view
        returns (uint256);

    function addRewards(uint256 newBZRX, uint256 newStableCoin)
        external;

    function stake(
        address[] calldata tokens,
        uint256[] calldata values
    )
        external;

    function stake(
        address[] calldata tokens,
        uint256[] calldata values,
        bool claimSushi
    )
        external;

    function unstake(
        address[] calldata tokens,
        uint256[] calldata values
    )
        external;

    function unstake(
        address[] calldata tokens,
        uint256[] calldata values,
        bool claimSushi
    )
        external;

    function earned(address account)
        external
        view
        returns (
            uint256 bzrxRewardsEarned,
            uint256 stableCoinRewardsEarned,
            uint256 bzrxRewardsVesting,
            uint256 stableCoinRewardsVesting
        );

    function getVariableWeights()
        external
        view
        returns (uint256 vBZRXWeight, uint256 iBZRXWeight, uint256 LPTokenWeight);

    function balanceOfByAsset(
        address token,
        address account)
        external
        view
        returns (uint256 balance);

    function balanceOfByAssets(
        address account)
        external
        view
        returns (
            uint256 bzrxBalance,
            uint256 iBZRXBalance,
            uint256 vBZRXBalance,
            uint256 LPTokenBalance,
            uint256 LPTokenBalanceOld
        );

    function balanceOfStored(
        address account)
        external
        view
        returns (uint256 vestedBalance, uint256 vestingBalance);

    function totalSupplyStored()
        external
        view
        returns (uint256 supply);

    function vestedBalanceForAmount(
        uint256 tokenBalance,
        uint256 lastUpdate,
        uint256 vestingEndTime)
        external
        view
        returns (uint256 vested);

    function votingBalanceOf(
        address account,
        uint256 proposalId)
        external
        view
        returns (uint256 totalVotes);

    function votingBalanceOfNow(
        address account)
        external
        view
        returns (uint256 totalVotes);

    function _setProposalVals(
        address account,
        uint256 proposalId)
        external
        returns (uint256);

    function exit()
        external;

    function addAltRewards(address token, uint256 amount)
        external;

    function pendingAltRewards(address token, address _user)
        external
        view
        returns (uint256);

}
