# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`

from firebase_admin import initialize_app
from firebase_functions import https_fn, identity_fn

initialize_app()

@identity_fn.before_user_signed_in()
def test_before_user_signed_in(event: identity_fn.AuthBlockingEvent) -> identity_fn.BeforeSignInResponse | None:
    https_error = https_fn.HttpsError(
        code=https_fn.FunctionsErrorCode.UNAUTHENTICATED,
        message="authentication failed",
        details={
            "type": "mfa",
        },
    )
    
    print("Raising HttpsError:", https_error)
    
    raise https_error