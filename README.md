# SNS Page Hook

Using SNS Page Hook requires that:

1. You have the [sns extension](http://github.com/radiant/radiant-sns-extension) installed
2. Modules that add Radius tags must end in "Tags", such as AssetTags
3. You load this extension last to ensure that all tags are included for SNS.

This may not work for some features. 

This extension sets the typical tag.globals.page as tag.globals.text_asset and as a result, 
there may be some methods called that expect a page, but actually get a text_asset.

Is something wrong? [Send pull requests or report bugs](http://github.com/saturnflyer/radiant-sns_page_hook-extenson)

Built by [Saturn Flyer](http://www.saturnflyer.com)