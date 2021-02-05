from flask import request
from flask_restful import Resource
from models import db, User, UserSchema

users_schema = UserSchema(many=True)
user_schema = UserSchema()


class UserResource(Resource):
    def get(self):
        users = User.query.all()
        users = users_schema.dump(users).data
        return {"status": "success", "data": users}, 200

    def post(self):
        json_data = request.get_json(force=True)
        if not json_data:
            return {"message": "No input data provided"}, 400
        # Validate and deserialize input
        data, errors = user_schema.load(json_data)
        if errors:
            return errors, 422
        user = User.query.filter_by(username=data["username"]).first()
        email = User.query.filter_by(email=data["email"]).first()
        if user:
            return {"message": "User already exists"}, 400
        if email:
            return {"message": "Email already exists"}, 400
        user = User(
            username=json_data["username"],
            email=json_data["email"],
            password=json_data["password"],
        )

        db.session.add(user)
        db.session.commit()

        result = user_schema.dump(user).data

        return {"status": "success", "data": result}, 201

    def put(self):
        json_data = request.get_json(force=True)
        if not json_data:
            return {"message": "No input data provided"}, 400
        # Validate and deserialize input
        data, errors = user_schema.load(json_data)
        if errors:
            return errors, 422
        user = User.query.filter_by(id=data["id"]).first()
        if not category:
            return {"message": "User does not exist"}, 400
        user.name = data["name"]
        db.session.commit()

        result = user_schema.dump(category).data

        return {"status": "success", "data": result}, 204

    def delete(self):
        json_data = request.get_json(force=True)
        if not json_data:
            return {"message": "No input data provided"}, 400
        # Validate and deserialize input
        # data, errors = user_schema.load(json_data)
        uid = json_data["id"]
        # if errors:
        #     return errors, 422
        user = User.query.filter_by(id=uid).delete()
        db.session.commit()

        result = user_schema.dump(user).data

        return {"status": "success", "data": result}, 204
