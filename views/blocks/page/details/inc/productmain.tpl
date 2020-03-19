[{$smarty.block.parent}]
[{if $oViewConf->isModuleActive('oepaypal') && $oViewConf->showPayPalBannerOnProductDetailsPage()}]
    [{assign var="bannerAmount" value=$oxcmp_basket->getBruttoSum()}]
    [{if $oxcmp_basket->isPriceViewModeNetto()}]
        [{assign var="bannerAmount" value=$oxcmp_basket->getNettoSum()}]
    [{/if}]
    [{if $oDetailsProduct->getFPrice() && $oxcmp_basket->getArtStockInBasket($oDetailsProduct->getId()) === 0}]
        [{assign var="oPrice" value=$oDetailsProduct->getPrice()}]
        [{if $oDetailsProduct->isParentNotBuyable()}]
            [{assign var="oPrice" value=$oDetailsProduct->getVarMinPrice()}]
        [{/if}]
        [{assign var="productPrice" value=$oPrice->getPrice()}]
        [{assign var="bannerAmount" value=$bannerAmount+$productPrice}]
    [{/if}]

    [{include file="installment_banners.tpl" amount=$bannerAmount selector=$oViewConf->getPayPalBannerProductDetailsPageSelector()}]
[{/if}]
