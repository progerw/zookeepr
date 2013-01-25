"""empty message

Revision ID: 108bc71e0757
Revises: f690787df65
Create Date: 2013-01-25 16:46:34.543245

"""

# revision identifiers, used by Alembic.
revision = '108bc71e0757'
down_revision = 'f690787df65'

from alembic import op
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.add_column('fulfilment', sa.Column('code', sa.Text(), nullable=True))
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('fulfilment', 'code')
    ### end Alembic commands ###
