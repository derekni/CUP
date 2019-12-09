from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Bathroom(db.Model):
    __tablename__ = 'bathroom'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    description = db.Column(db.String, nullable=False)
    #latitude = db.Column(db.Float, nullable=False)
    #longitude = db.Column(db.Float, nullable=False)
    avgRating = db.Column(db.String, nullable=False)
    numRatings = db.Column(db.String, nullable=False)

    def __init__(self, **kwargs):
        self.name = kwargs.get('name', '')
        self.description = kwargs.get('description', '')
        #self.latitude = kwargs.get('latitude', '')
        #self.longitude = kwargs.get('longitude', '')
        self.avgRating = kwargs.get('avgRating', '')
        self.numRatings = kwargs.get('numRatings', '')
    
    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            #'latitude': self.latitude,
            #'longitude': self.longitude,
            'avgRating': self.avgRating,
            'numRatings': self.numRatings
        }
    
    def updateAvgRating(self, avgRating, numRatings, newRating):
        self.avgRating = (avgRating * numRatings + newRating) / (numRatings + 1)
        self.numRatings += 1