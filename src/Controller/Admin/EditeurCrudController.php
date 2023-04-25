<?php

namespace App\Controller\Admin;

use App\Entity\Editeur;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class EditeurCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Editeur::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
