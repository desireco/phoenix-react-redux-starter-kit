defmodule PhoenixReactReduxStarterKit.SignInTest do
  use PhoenixReactReduxStarterKit.IntegrationCase

  @tag :integration
  test "GET /" do
    navigate_to "/"

    assert page_title == "Sign in | Phoenix React Redux Starter Kit"
    assert element_displayed?({:id, "sign_in_form"})
  end

  @tag :integration
  test "Sign in with wrong email/password" do
    navigate_to "/"

    assert element_displayed?({:id, "sign_in_form"})

    sign_in_form = find_element(:id, "sign_in_form")

    sign_in_form
    |> find_within_element(:id, "email")
    |> fill_field("incorrect@email.com")

    sign_in_form
    |> find_within_element(:css, "button")
    |> click

    assert element_displayed?({:class, "error"})

    assert page_source =~ "Invalid email or password"
  end

  @tag :integration
  test "Sign in with existing email/password" do
    user = create_user

    user_sign_in(%{user: user})

    assert page_source =~ "#{user.first_name} #{user.last_name}"
    assert page_source =~ "Welcome to the Phoenix React Redux Starter Kit"
  end
end