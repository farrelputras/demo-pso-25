import AddProduct from "@/nextjs-crud/app/components/add-product";
import DeleteProduct from "@/nextjs-crud/app/components/delete-product";
import EditProduct from "@/nextjs-crud/app/components/edit-product";
import ViewProduct from "@/nextjs-crud/app/components/view-product";
import React from "react";

const ActionProductId = ({ params }) => {
  const { action, id } = params;
  switch (action) {
    case "add":
      return <AddProduct />;
    case "edit":
      return <EditProduct id={id} />;
    case "view":
      return <ViewProduct id={id} />;
  }
};

export default ActionProductId;
