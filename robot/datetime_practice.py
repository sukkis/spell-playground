"""Robot keyword for getting timestamp adjusted with n minutes."""

from datetime import datetime, timedelta
from robot.api.deco import keyword


@keyword
def get_adjusted_time(adjust_minutes: int):
    """Add n minutes to current time.
    Pretty print like '2023-03-02T09:04:19.695Z'
    """
    raw = current_datetime() + timedelta(minutes=adjust_minutes)
    return raw.isoformat()[:3] + "Z"


def current_datetime():
    """Current time like '2023-03-02T09:04:19.695123'
    This is a starting point, since we really need
    timestamps like '2023-03-02T09:04:19.695Z',
    i.e. 3 digits removed and 'Z' added.
    """
    return datetime.datetime.utcnow()

