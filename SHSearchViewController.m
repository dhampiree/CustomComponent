...

SHSearchModeView* smView = [[SHSearchModeView alloc] initWithFrame:self.searchModeView.bounds];
searchModeView.delegate = self;

if(CURRENT_ACCOUNT_TYPE == ACCOUNT_TYPE_FACEBOOK) {
    [searchModeView setupItemsWithTitles:@[NSLocalizedString(@"People", @""),
                                   NSLocalizedString(@"Tags", @""),
                                   NSLocalizedString(@"Posts", @"")]];
}
if(CURRENT_ACCOUNT_TYPE == ACCOUNT_TYPE_TWITTER) {
    [searchModeView setupItemsWithTitles:@[NSLocalizedString(@"People", @""),
                                   NSLocalizedString(@"Tags", @"")]];
}
if(CURRENT_ACCOUNT_TYPE == ACCOUNT_TYPE_INSTAGRAM) {
    [searchModeView setupItemsWithTitles:@[NSLocalizedString(@"People", @""),
                                   NSLocalizedString(@"Tags", @"")]];
}

[self.searchModeView addSubview:searchModeView];

...
