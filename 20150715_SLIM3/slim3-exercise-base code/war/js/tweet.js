/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
//TODO: Write javascript function that takes formID/name as parameter. (optional)
//TODO: the method should change the action url of the specified form to your delete tweet controller url.
//TODO: the method should then submit the specified form.
//TODO:	clue: use this method in the onClick attribute of your delete button.

function changeAction(form_id) {
	form_id.action="/twitter/delete";
}