defmodule Candone.TasksTest do
  use Candone.DataCase

  alias Candone.Tasks

  describe "tasks" do
    alias Candone.Tasks.Task

    import Candone.TasksFixtures

    @invalid_attrs %{name: nil, description: nil, cost: nil, urgency: nil, stage: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{name: "some name", description: "some description", cost: 42, urgency: 42, stage: 42}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.name == "some name"
      assert task.description == "some description"
      assert task.cost == 42
      assert task.urgency == 42
      assert task.stage == 42
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", cost: 43, urgency: 43, stage: 43}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.name == "some updated name"
      assert task.description == "some updated description"
      assert task.cost == 43
      assert task.urgency == 43
      assert task.stage == 43
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
