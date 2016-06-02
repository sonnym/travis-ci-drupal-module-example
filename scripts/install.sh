#!/bin/sh

echo "Installing drupal to " . $DOCROOT

DATABASE_PASS="test"
cd $DOCROOT

#link all core files
ln -s $ZENCI_DEPLOY_DIR/* ./
ln -s $ZENCI_DEPLOY_DIR/.htaccess ./

#copy sites directory instead of linking to move it out of git repo
rm -f sites
cp -r $ZENCI_DEPLOY_DIR/sites ./

#Install drupal

drush site-install standard -y --root=$DOCROOT --account-mail=admin@$DOMAIN --uri=http://$DOMAINNAME --site-name=$SITENAME --site-mail=$SITEMAIL --db-url=mysql://$DATABASE_USER:$DATABASE_PASS@localhost/$DATABASE_NAME