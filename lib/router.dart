import 'package:api_rest/controllers/todo_controller.dart';
import 'package:darto/darto.dart';

Router createRoutes() {
  final router = Router();
  final todoController = TodoController();

  router.get('/todos', todoController.getTodos);
  router.post('/todos', todoController.addTodo);
  router.get('/todos/:id', todoController.getTodo);
  router.delete('/todos/:id', todoController.deleteTodo);
  router.put('/todos/:id', todoController.updateTodo);

  return router;
}
