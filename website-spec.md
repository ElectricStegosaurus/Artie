# Artie Website Spec

## Goals

Enable creators to specify the episodes they're creating and seeking sponsors for.

Enable sponsors to identify available creators and initiate sponsorship deals.

We do not need to support authentication or access controls for now.


## Screens

### Entry screen

Ask the user whether they're a Creator or an Advertiser, and direct them to the corresponding flow.

### Creator screen

The user can choose from existing Creators or make a new one.
Choosing an existing creator brings up a table listing their episodes,
with the attributes of each episode, including the number of deals
associated with that episode.  Each row of the table can be expanded
to show the details of all deals associated with that episode.

A button near the top enables the user to create a new episode, moving
to the episode creation screen.

### Creator creation screen

The user specifies their name and subscriber info, and is then directed to the Episode creation screen.

### Episode creation screen

The user specifies all the episode parameters.

They also have the option to upload an episode script as a file, or
link to an existing file online.  For now the upload will place the
file on local disk.

### Sponsor screen

The user can choose from existing Sponsors or make a new one.
Choosing an existing sponsor brings up a table listing their
sponsorships, with the attributes of each sponsorship.  A button near
the top enables them to create a new sponsorship, moving to the
sponsorship creation screen.

### Sponsorship creation screen

The user specifies all the sponsorship parameters.

### Sponsorship details page

The user sees all Deals associated with this sponsorship, including
all details about the deal.

